﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.Foundation.NoSeries;

codeunit 303 "No. Series"
{
    Access = Public;

    var
        NoSeriesImpl: Codeunit "No. Series - Impl.";

    /// <summary>
    /// Get the next number in the number series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the number series.</param>
    /// <param name="SeriesDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeriesCode: Code[20]; SeriesDate: Date): Code[20]
    begin
        exit(NoSeriesImpl.GetNextNo(NoSeriesCode, SeriesDate, false));
    end;

    /// <summary>
    /// Get the next number in the number series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the number series.</param>
    /// <param name="SeriesDate">The date of retrieval, this will influence which line is used.</param>
    /// <param name="HideErrorsAndWarnings"></param>
    /// <returns>The next number in the series, if HideErrorsAndWarnings is true and errors occured, a blank code is returned.</returns>
    procedure GetNextNo(NoSeriesCode: Code[20]; SeriesDate: Date; HideErrorsAndWarnings: Boolean): Code[20] // TODO: This should return true/false of whether we could get the next no., not a blank code.
    begin
        exit(NoSeriesImpl.GetNextNo(NoSeriesCode, SeriesDate, HideErrorsAndWarnings));
    end;

    procedure PeekNextNo(NoSeriesCode: Code[20]; UsageDate: Date): Code[20] // TODO: Return boolean whether a number could actually be retrieved or not? Don't rely on whether the code is blank or not
    begin
        exit(NoSeriesImpl.PeekNextNo(NoSeriesCode, UsageDate));
    end;

    procedure GetLastNoUsed(NoSeriesCode: Code[20]): Code[20] // TODO: Change to NoSeriesCode?
    begin
        exit(NoSeriesImpl.GetLastNoUsed(NoSeriesCode));
    end;

    /// <summary>
    /// Verifies that the number series is set to manual.
    /// This function allows manual numbers for blank No. Series Codes.
    /// </summary>
    /// <param name="NoSeriesCode"></param>
    procedure TestManual(NoSeriesCode: Code[20]) // TODO: Make this a try function, such that partners can handle cases where the no. series is not set to manual
    begin
        NoSeriesImpl.TestManual(NoSeriesCode);
    end;

    procedure AreNoSeriesRelated(DefaultNoSeriesCode: Code[20]; RelatedNoSeriesCode: Code[20]): Boolean // This is basically what InitSeries does, it then uses the other series if they are and gets a number
    begin
        exit(NoSeriesImpl.AreNoSeriesRelated(DefaultNoSeriesCode, RelatedNoSeriesCode));
    end;

    procedure SelectRelatedNoSeries(OriginalNoSeriesCode: Code[20]; var NewNoSeriesCode: Code[20]): Boolean
    begin
        exit(NoSeriesImpl.SelectRelatedNoSeries(OriginalNoSeriesCode, NewNoSeriesCode));
    end;

    // Implement?: FindNoSeriesLine, IsCurrentNoSeriesLine, ReverseGetNextNo(apac), 
}