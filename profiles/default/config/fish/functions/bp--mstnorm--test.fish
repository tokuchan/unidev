function bp--mstnorm--test
    pushd $HHOME/dev/bellport/build-debug \
        && banner--banner Run mstnorm_test \
        && ./bin/mstnorm_test \
        && banner--banner Run mstorm \
        && ./bin/mstnorm --pcaps $HHOME/optiq_equities_france_fbmu_1g--2022--06--23/*.pcap.zst --feeds optiq_equities_france_fbmu_1g --symbol-mapping-file $HHOME/optiq_equities_france_fbmu_1g--2022--06--23/OptiqMDG_Production_CashStandingDataFile_Equities_20220623.xml.gz --no-csv | head -20\
        && popd
end
