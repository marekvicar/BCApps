// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace Microsoft.Foundation.NoSeries;

/// <summary>
/// Provides an interface for interacting with number series.
/// This codeunit batches requests until SaveState() is called (The database is not updated in the meantime but locked instead). For more direct database interactions, see codeunit "No. Series".
/// </summary>
codeunit 308 "No. Series - Batch"
{
    Access = Public;

    var
        NoSeriesBatchImpl: Codeunit "No. Series - Batch Impl."; // Required to keep state

    #region GetNextNo
    /// <summary>
    /// Get the next number in the No. Series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// Defaults UsageDate to WorkDate.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeriesCode: Code[20]): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetNextNo(NoSeriesCode));
    end;

    /// <summary>
    /// Get the next number in the No. Series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeriesCode: Code[20]; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetNextNo(NoSeriesCode, UsageDate));
    end;

    /// <summary>
    /// Get the next number in the No. Series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// Defaults UsageDate to WorkDate.
    /// </summary>
    /// <param name="NoSeries">The No. Series to use.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeries: Record "No. Series"): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetNextNo(NoSeries));
    end;

    /// <summary>
    /// Get the next number in the No. Series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeries">The No. Series to use.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeries: Record "No. Series"; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetNextNo(NoSeries, UsageDate));
    end;

    /// <summary>
    /// Get the next number in the No. Series.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesLine">The No. Series line to use.</param>
    /// <param name="UsageDate">The last date used, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure GetNextNo(NoSeriesLine: Record "No. Series Line"; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetNextNo(NoSeriesLine, UsageDate));
    end;
    #endregion

    #region PeekNextNo
    /// <summary>
    /// Get the next number in the No. Series, without incrementing the number.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// Defaults UsageDate to WorkDate.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    /// <returns>The next number in the series.</returns>
    procedure PeekNextNo(NoSeriesCode: Code[20]): Code[20]
    begin
        exit(NoSeriesBatchImpl.PeekNextNo(NoSeriesCode));
    end;

    /// <summary>
    /// Get the next number in the No. Series, without incrementing the number.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure PeekNextNo(NoSeriesCode: Code[20]; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.PeekNextNo(NoSeriesCode, UsageDate));
    end;

    /// <summary>
    /// Get the next number in the No. Series, without incrementing the number.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// Defaults UsageDate to WorkDate.
    /// </summary>
    /// <param name="NoSeries">The No. Series to use.</param>
    /// <returns>The next number in the series.</returns>
    procedure PeekNextNo(NoSeries: Record "No. Series"): Code[20]
    begin
        exit(NoSeriesBatchImpl.PeekNextNo(NoSeries));
    end;

    /// <summary>
    /// Get the next number in the No. Series, without incrementing the number.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeries">The No. Series to use.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure PeekNextNo(NoSeries: Record "No. Series"; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.PeekNextNo(NoSeries, UsageDate));
    end;

    /// <summary>
    /// Get the next number in the No. Series, without incrementing the number.
    /// This function will select the proper No. Series line and use the appropriate implementation to get the next number.
    /// </summary>
    /// <param name="NoSeriesLine">The No. Series line to use.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <returns>The next number in the series.</returns>
    procedure PeekNextNo(NoSeriesLine: Record "No. Series Line"; UsageDate: Date): Code[20]
    begin
        exit(NoSeriesBatchImpl.PeekNextNo(NoSeriesLine, UsageDate));
    end;
    #endregion

    /// <summary>
    /// Get the last number used in the No. Series.
    /// </summary>
    /// <param name="NoSeriesLine">The No. Series line to use.</param>
    /// <returns>The last number used in the series.</returns>
    procedure GetLastNoUsed(var NoSeriesLine: Record "No. Series Line"): Code[20]
    begin
        exit(NoSeriesBatchImpl.GetLastNoUsed(NoSeriesLine));
    end;

    /// <summary>
    /// Verifies that the No. Series allows using manual numbers.
    /// Note: This function allows manual numbers for blank No. Series Codes.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    procedure TestManual(NoSeriesCode: Code[20])
    var
        NoSeries: Codeunit "No. Series";
    begin
        NoSeries.TestManual(NoSeriesCode);
    end;

    procedure TestManual(NoSeriesCode: Code[20]; DocumentNo: Code[20])
    var
        NoSeries: Codeunit "No. Series";
    begin
        NoSeries.TestManual(NoSeriesCode, DocumentNo);
    end;

    /// <summary>
    /// Simulate the specified No. Series at the specified date starting with the indicated number.
    /// </summary>
    /// <param name="NoSeriesCode">Code for the No. Series.</param>
    /// <param name="UsageDate">The date of retrieval, this will influence which line is used.</param>
    /// <param name="LastNoUsed">Simulate this is the last number used.</param>
    /// <returns></returns>
    procedure SimulateGetNextNo(NoSeriesCode: Code[20]; UsageDate: Date; LastNoUsed: Code[20]): Code[20]
    var
        NoSeriesBatchImplSim: Codeunit "No. Series - Batch Impl.";
    begin
        exit(NoSeriesBatchImplSim.SimulateGetNextNo(NoSeriesCode, UsageDate, LastNoUsed));
    end;

    /// <summary>
    /// Puts the codeunit in simulation mode which disables the ability to save state.
    /// </summary>
    procedure SetSimulationMode()
    begin
        NoSeriesBatchImpl.SetSimulationMode();
    end;

    /// <summary>
    /// Save the state of the No. Series Line to the database.
    /// </summary>
    /// <param name="TempNoSeriesLine">No. Series Line we want to save state for.</param>
    procedure SaveState(TempNoSeriesLine: Record "No. Series Line" temporary);
    begin
        NoSeriesBatchImpl.SaveState(TempNoSeriesLine);
    end;

    /// <summary>
    /// Save all changes to the database.
    /// </summary>
    procedure SaveState();
    begin
        NoSeriesBatchImpl.SaveState();
    end;
}