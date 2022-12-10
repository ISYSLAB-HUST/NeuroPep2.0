package com.neuropeptide.service;

import com.neuropeptide.entity.NPTab;
import com.neuropeptide.entity.SubTab;

public interface ISaveService {
    void saveSubmission(SubTab var1);

    void saveApproval(NPTab var1);
}
