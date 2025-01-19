Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BC1DF972
	for <regressions@lists.linux.dev>; Sun, 19 Jan 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737300590; cv=none; b=WGN6U655ZFZIqvrvgADTVuaXed0kMCfarRvSilnYC8The1Db9u5x1pH/HfVPCsK3fclbbuNWuSp75ch4w6b8/KB5RytBbK14SwIujaN0m1eJE54UYatacsrtyr9mLTYH/ifnLzyk8pxICde1gtKTVJBthmY8l8r81KnF5NvPwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737300590; c=relaxed/simple;
	bh=swaz8J39JWbNjUdvDsHZIZnG7Dgw0RPv7HFdMhQYV/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AesiCiO24r7q36YvcBlqFqpx1zmbCDh6/6q5TsPrXu7Cs6rTSzD8RzypRT57oapKgezss4iGocFKRGfhGyu0XiZdUOEW8ubAiPTOo9cKTEwwda3RESt9QXhMpO7EDidZsZQFBp7al+psqpNWGpTsZFsv3L2fAwwEzt8loCa3bg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YoIAHeYk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YoIAHeYk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso7370552a91.1
        for <regressions@lists.linux.dev>; Sun, 19 Jan 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737300588; x=1737905388; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/nzl3YeZxFKHcxSAxwA8cJyhGMSaJuP514szE3idkQ=;
        b=YoIAHeYkgR5wKWZ+A3FWnMLyEPH1L3ORO8PwJ2EzvowaRnTns1RjGJd/TJRKtp1dFx
         87pB1SQcBmQGZlPsJAptF2bRh3UQuuiAZ+YNtWFTiwqCUidCAl2rOdZJ+8s3ft0Hr5IB
         bp0sSRcXv6CokgXA/D5bbMwNDnZEl2NAaXymHN1ITR/7vVIEw1XUZBiV7CdI8Lc/aQDZ
         vpPH8Szl/NdKrV3iSgHjd4qizspYZNH5WTDXdVokBNUswNALBAX+0XHs2tM17A8g979B
         baL8ELL8UeS6yMEiQjky4oF3qN2p7cBGEMHnOm9k8AUHnbz/ThT1totUjgMoO1ZOUJoe
         sggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737300588; x=1737905388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/nzl3YeZxFKHcxSAxwA8cJyhGMSaJuP514szE3idkQ=;
        b=EmExep7PM6KCH6xoNa8aCONFCqTNNWGQa9g36zqFGblC3faVXAtddq9TjADA6ftAMi
         1fXyLbA87GjlL5u4i0zyYGvtmA6ynpG1UpOp+W1QFRNYQWrzeNQYorvqRPejXgaFimkp
         /OqswEcjAhjb6lZquIS/S2jn2BruMt9Z9tsacqVsuriJiYlw4AkFmvXjWgSB7nLiFZ3K
         jqLNuS8zZPyLU3pWVxvVTSRNtNY1bbTRvAw5i0uvkIum+Ky72LR24WZ1RPW84s2wTCsn
         eMdMfgyPx/Y4azT0kjQmQFMv1I+pnDh3GalcXRVBmANyZouEFx8ORMXmziZHYrsshsRP
         OJiw==
X-Forwarded-Encrypted: i=1; AJvYcCW9UMbTmsNOZ6UhaPgZLdjsa00yUooPq55kOeoLkz4H3jLCdPV2zWdNqcsKIU67yIaHDd9LE02WZva3gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXFmaAQC3vEA56gpi/qsSpTLBNU6WfBmndbCbBaajz4kNHZJGV
	1yjMmILatAVZcRnYIV1sYF94kqiYcrj7/oGh4+busaI6hDjmUtQ1J0fSBWDvzw==
X-Gm-Gg: ASbGnctbB8eTmoIB3Pkcci5c6mOcb/8IQPuoomvb8FEdUZhscBUfqSIPZaq8q+3Gsnt
	pfCXRXDiVeaUzHOQA18xDEc0EqDTfS37PGSyd9Q3rmt02NKvcdKqB/zC62qTBnLqdKWBl1+5mCi
	+2UJ2103n+ScuLQ7AxW8mOkFhKpsPKwmwEUd9uqA8ho+LEErEyYe/Lq1E1xE693TRuYFfNDsiLX
	+1CuWbl3iN0rY3GsZNTg9JX2iz9CphhMf2+MZH2hX8+qPo1VTXJ/37IJoX1TW18C8IWyFcowDTh
	dbClyw==
X-Google-Smtp-Source: AGHT+IHH9RyAJaMDiBIUlzUSo3FIv4IGvtL2SuNMtfMDQuSucT5oNUrpDoMY714iHbFDGPzis+NQTg==
X-Received: by 2002:a05:6a00:8c0b:b0:725:e386:3c5b with SMTP id d2e1a72fcca58-72d8c4ae2b5mr25269277b3a.5.1737300587656;
        Sun, 19 Jan 2025 07:29:47 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9b9b1esm5463049b3a.99.2025.01.19.07.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:29:47 -0800 (PST)
Date: Sun, 19 Jan 2025 20:59:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, rafael@kernel.org,
	ulf.hansson@linaro.org, Johan Hovold <johan@kernel.org>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Markus.Elfring@web.de, quic_mrana@quicinc.com,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7 2/2] PCI: Enable runtime pm of the host bridge
Message-ID: <20250119152940.6yum3xnrvqx2xjme@thinkpad>
References: <20250113162549.a2y7dlwnsfetryyw@thinkpad>
 <20250114211653.GA487608@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114211653.GA487608@bhelgaas>

On Tue, Jan 14, 2025 at 03:16:53PM -0600, Bjorn Helgaas wrote:
> On Mon, Jan 13, 2025 at 09:55:49PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jan 07, 2025 at 03:27:59PM +0100, Johan Hovold wrote:
> > > On Tue, Jan 07, 2025 at 07:40:39PM +0530, Krishna Chaitanya Chundru wrote:
> > > > On 1/7/2025 6:49 PM, Johan Hovold wrote:
> > > 
> > > > >> @@ -3106,6 +3106,17 @@ int pci_host_probe(struct pci_host_bridge *bridge)
> > > > >>   		pcie_bus_configure_settings(child);
> > > > >>   
> > > > >>   	pci_bus_add_devices(bus);
> > > > >> +
> > > > >> +	/*
> > > > >> +	 * Ensure pm_runtime_enable() is called for the controller drivers,
> > > > >> +	 * before calling pci_host_probe() as pm frameworks expects if the
> > > > >> +	 * parent device supports runtime pm then it needs to enabled before
> > > > >> +	 * child runtime pm.
> > > > >> +	 */
> > > > >> +	pm_runtime_set_active(&bridge->dev);
> > > > >> +	pm_runtime_no_callbacks(&bridge->dev);
> > > > >> +	devm_pm_runtime_enable(&bridge->dev);
> > > > >> +
> > > > >>   	return 0;
> > > > >>   }
> > > > >>   EXPORT_SYMBOL_GPL(pci_host_probe);
> > > > > 
> > > > > I just noticed that this change in 6.13-rc1 is causing the
> > > > > following warning on resume from suspend on machines like the
> > > > > Lenovo ThinkPad X13s:
> > > 
> > > > Can you confirm if you are seeing this issue is seen in the
> > > > boot-up case also. As this part of the code executes only at the
> > > > boot time and will not have effect in resume from suspend.
> > > 
> > > No, I only see it during resume. And enabling runtime PM can (and
> > > in this case, obviously does) impact system suspend as well. 
> > > 
> > > > > 	pci0004:00: pcie4: Enabling runtime PM for inactive device with active children
> > > 
> > > > I believe this is not causing any functional issues.
> > > 
> > > It still needs to be fixed.
> > > 
> > > > > which may have unpopulated ports (this laptop SKU does not
> > > > > have a modem).
> > > 
> > > > Can you confirm if this warning goes away if there is some
> > > > endpoint connected to it.
> > > 
> > > I don't have anything to connect to the slot in this machine, but
> > > this seems to be the case as I do not see this warning for the
> > > populated slots, nor on the CRD reference design which has a modem
> > > on PCIe4.
> > 
> > Yes, this is only happening for unpopulated slots and the warning
> > shows up only if runtime PM is enabled for both PCI bridge and host
> > bridge. This patch enables the runtime PM for host bridge and if the
> > PCI bridge runtime PM is also enabled (only happens now for
> > ACPI/BIOS based platforms), then the warning shows up only if the
> > PCI bridge was RPM suspended (mostly happens if there was no device
> > connected) during the system wide resume time.
> > 
> > For the sake of reference, PCI host bridge is the parent of PCI
> > bridge.
> > 
> > Looking at where the warning gets triggered (in
> > pm_runtime_enable()), we have the below checks:
> > 
> > dev->power.runtime_status == RPM_SUSPENDED
> > !dev->power.ignore_children
> > atomic_read(&dev->power.child_count) > 0
> > 
> > When pm_runtime_enable() gets called for PCI host bridge:
> > 
> > dev->power.runtime_status = RPM_SUSPENDED
> > dev->power.ignore_children = 0
> > dev->power.child_count = 1
> > 
> > First 2 passes seem legit, but the issue is with the 3rd one. Here,
> > the child_count of 1 means that the PCI host bridge has an 'active'
> > child (which is the PCI bridge). The PCI bridge was supposed to be
> > RPM_SUSPENDED as the resume process should first resume the parent
> > (PCI host bridge). But this is not the case here.
> > 
> > Then looking at where the child_count gets incremented, it leads to
> > pm_runtime_set_active() of device_resume_noirq().
> > pm_runtime_set_active() is only called for a device if
> > dev_pm_skip_suspend() succeeds, which requires
> > DPM_FLAG_SMART_SUSPEND flag to be set and the device to be runtime
> > suspended.
> > 
> > This criteria matches for PCI bridge. So its status was set to
> > 'RPM_ACTIVE' even though the parent PCI host bridge was still in the
> > RPM_SUSPENDED state. I don't think this is a valid condition as seen
> > from the warning triggered for PCI host bridge when
> > pm_runtime_enable() is called from device_resume_early():
> > 
> > pci0004:00: pcie4: Enabling runtime PM for inactive device with
> > active children
> > 
> > I'm not sure of what the fix is in this case. But removing the
> > DPM_FLAG_SMART_SUSPEND flag from PCI bridge driver (portdrv) makes
> > the warning go away. This indicates that something is wrong with the
> > DPM_FLAG_SMART_SUSPEND flag handling in PM core.
> > 
> > Ulf/Rafael, thoughts?
> 
> What's the plan for this?  Does anybody have a proposal?
> 

TBH, I don't know how to fix this issue in a proper way. I need inputs from
Rafael/Ulf.

> IIUC there is no functional issue, but the new warning must be fixed,
> and it would sure be nice to do it before v6.13.  If there *is* a
> functional problem, we need to consider a revert ASAP.
> 

There is no functional problem that I'm aware of, so revert is not warranted.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
