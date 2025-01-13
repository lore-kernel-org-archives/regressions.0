Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D82297EE
	for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785561; cv=none; b=XwF0FLtueaIXAxkfY14VXUnvUZzZBl7Dzfbuz8wDpMkPVFzCF/qXAkEkSq1IS4Vat7zQFGxOCT6yUu42hI/fEIJBXuZvSb7PwVP3CgUoLJvdvP4t/o4CnltaSyF1uaT/wDJUrKS9jz06Ns4OvgOQfXUO85Z6CpdnhLZFkyUYRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785561; c=relaxed/simple;
	bh=1kDW32MuSVAFdsYNImZqjgIN1GG6jDDnrmWQYE1QmXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSE15Qs+6JJX+H+i2GmudAJNhQW1Amb741/TkdtJel4IMl7EK4nMNnuhwmyGACgkxWvJN/rBGiC73swslVwJ3tgh9JrYW7HhTDkImWdiHPTckN5LuRxZtrPIVqaZ/aRMmIYpjwDYiDLW+qtzq3N3SkWtUu5ZeShS4ftgIPoL4+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpPnyXoV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpPnyXoV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21bc1512a63so15131925ad.1
        for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736785558; x=1737390358; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aT4ZLTVIwGUtbe1QI6YLbzJoKdwXpUmQWKkHVbvrXoU=;
        b=YpPnyXoVSKrZaZkrHOfrJgr1oIB9uJTl7dxvgd6fqKsGvuhJ2N00G2AfCrNBlrLHgv
         JpfZLV4DwU+vDp/ywKarvVtcxMTt0PSAVWf92FbB3v+sr1Qix2AC605ws09u5sGMHnun
         iqazudJ2TqgzlHyguOlsjgg6+auhK7hyk6hEsB3ue+DYiJHcUv3IyiATQIxnB84Ofkdx
         nuz9nbw9+xCMeEqPjlMN+NVGkxKmHswjAytVt0p35BATjU6wsq9D6t78Fg71hXTI97nN
         egiYJtmUs4aKBzQlIyeMkZjI4ErPCyVbH5lNsJsr/Q3eSMNXziZpByJqH6S3CXKDOfHv
         vQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736785558; x=1737390358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aT4ZLTVIwGUtbe1QI6YLbzJoKdwXpUmQWKkHVbvrXoU=;
        b=OHg/aspqNJmdGXVjiBqKIF/nSmWwtNUBIYAkjwtRc8wx7xONY47fRKioDDrJtNBDds
         66zc0g6gk9e2RY+aYK4v1ltA6O9CSiWedJnACSYZwakR51h+KOhg9VVD5tidb52TkxtB
         JdKDPMQmC8tyo4ktGlqMqAyI4ai4FaD5viMbVZ32aDWnHxEdFrvZRhvYy1OUVx2Yu3Mq
         CYYwHeyaTwmvfrOpZD/IoemRIhoar2xnBaB6cvCrQHlXQzkfrvbcwccVVGLYsBMEUyi5
         L2n0G2xrAuww0COXxyPb4gGGIbIPRiFfwifeh885tOIjLGp76m3c0bzdRKkheFYnLgGU
         GZvw==
X-Forwarded-Encrypted: i=1; AJvYcCVVqlwCKCjszQj3pNYjQnwjmVSwsxtckvyGq3R3YL60QKORMmkEYjiEIbSG5VDQwfzVl/IeUnMqKuqlCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoRRyxRoxKrojluC+/RtmqoLn1p3ue83t4zUQpmAKmq6ksW7T1
	fKivg2rAYl46yp35VhIFuflJy9KEu+v2z6sr8AUQHI5tmJLt5zzNEpXntLXmYQ==
X-Gm-Gg: ASbGncuzsHzkEDclC+nw9nlS9wKsZKb8CvGqitFJ+fwsuuduMw12pL9ZbxNMsRxuVzX
	/vL3lzCrkFZlj+RBIig5fqLjhrTliPecKciuQZ7VSmIL1kH1TqIOGqmWrLmHO2lT2z6/BKxPQy6
	0l//lXokxktiDgoUV/Nih/yvme3xnfkwBZDvFu6tH6pckpUzo8HLgLgITSbXMXoEdCvOcLRR1lX
	UCK8pkdz1/f3n2MV2QRJtKnBYg2UVRCC0bNW9KoJ00iNG5Rfmu1K0qoYA0/gr0y/SV6yg==
X-Google-Smtp-Source: AGHT+IEyDmGykdg1IhscNzCDFazeYHBoOZhp/2iBInjICsQGaz0Y3A6UzMlVkKTjV+xfYdDVDaQJPw==
X-Received: by 2002:a17:903:234f:b0:216:1cfa:2bda with SMTP id d9443c01a7336-21a83fc3891mr365457255ad.43.1736785557828;
        Mon, 13 Jan 2025 08:25:57 -0800 (PST)
Received: from thinkpad ([117.213.100.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219330sm55673625ad.132.2025.01.13.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 08:25:57 -0800 (PST)
Date: Mon, 13 Jan 2025 21:55:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: rafael@kernel.org, ulf.hansson@linaro.org,
	Johan Hovold <johan@kernel.org>
Cc: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Markus.Elfring@web.de, quic_mrana@quicinc.com, rafael@kernel.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7 2/2] PCI: Enable runtime pm of the host bridge
Message-ID: <20250113162549.a2y7dlwnsfetryyw@thinkpad>
References: <20241111-runtime_pm-v7-0-9c164eefcd87@quicinc.com>
 <20241111-runtime_pm-v7-2-9c164eefcd87@quicinc.com>
 <Z30p2Etwf3F2AUvD@hovoldconsulting.com>
 <7882105f-93a3-fab9-70a2-2dc55d6becfc@quicinc.com>
 <Z3057yuNjnn0NPqk@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3057yuNjnn0NPqk@hovoldconsulting.com>

+ Ulf (for the runtime PM related question)

On Tue, Jan 07, 2025 at 03:27:59PM +0100, Johan Hovold wrote:
> On Tue, Jan 07, 2025 at 07:40:39PM +0530, Krishna Chaitanya Chundru wrote:
> > On 1/7/2025 6:49 PM, Johan Hovold wrote:
> 
> > >> @@ -3106,6 +3106,17 @@ int pci_host_probe(struct pci_host_bridge *bridge)
> > >>   		pcie_bus_configure_settings(child);
> > >>   
> > >>   	pci_bus_add_devices(bus);
> > >> +
> > >> +	/*
> > >> +	 * Ensure pm_runtime_enable() is called for the controller drivers,
> > >> +	 * before calling pci_host_probe() as pm frameworks expects if the
> > >> +	 * parent device supports runtime pm then it needs to enabled before
> > >> +	 * child runtime pm.
> > >> +	 */
> > >> +	pm_runtime_set_active(&bridge->dev);
> > >> +	pm_runtime_no_callbacks(&bridge->dev);
> > >> +	devm_pm_runtime_enable(&bridge->dev);
> > >> +
> > >>   	return 0;
> > >>   }
> > >>   EXPORT_SYMBOL_GPL(pci_host_probe);
> > > 
> > > I just noticed that this change in 6.13-rc1 is causing the following
> > > warning on resume from suspend on machines like the Lenovo ThinkPad
> > > X13s:
> 
> > Can you confirm if you are seeing this issue is seen in the boot-up
> > case also. As this part of the code executes only at the boot time and
> > will not have effect in resume from suspend.
> 
> No, I only see it during resume. And enabling runtime PM can (and in
> this case, obviously does) impact system suspend as well. 
> 
> > > 	pci0004:00: pcie4: Enabling runtime PM for inactive device with active children
> 
> > I believe this is not causing any functional issues.
> 
> It still needs to be fixed.
> 
> > > which may have unpopulated ports (this laptop SKU does not have a modem).
> 
> > Can you confirm if this warning goes away if there is some endpoint
> > connected to it.
> 
> I don't have anything to connect to the slot in this machine, but this
> seems to be the case as I do not see this warning for the populated
> slots, nor on the CRD reference design which has a modem on PCIe4.
> 

Yes, this is only happening for unpopulated slots and the warning shows up only
if runtime PM is enabled for both PCI bridge and host bridge. This patch enables
the runtime PM for host bridge and if the PCI bridge runtime PM is also enabled
(only happens now for ACPI/BIOS based platforms), then the warning shows up only
if the PCI bridge was RPM suspended (mostly happens if there was no device
connected) during the system wide resume time.

For the sake of reference, PCI host bridge is the parent of PCI bridge.

Looking at where the warning gets triggered (in pm_runtime_enable()), we have
the below checks:

dev->power.runtime_status == RPM_SUSPENDED
!dev->power.ignore_children
atomic_read(&dev->power.child_count) > 0

When pm_runtime_enable() gets called for PCI host bridge:

dev->power.runtime_status = RPM_SUSPENDED
dev->power.ignore_children = 0
dev->power.child_count = 1

First 2 passes seem legit, but the issue is with the 3rd one. Here, the
child_count of 1 means that the PCI host bridge has an 'active' child (which is
the PCI bridge). The PCI bridge was supposed to be RPM_SUSPENDED as the resume
process should first resume the parent (PCI host bridge). But this is not the
case here.

Then looking at where the child_count gets incremented, it leads to
pm_runtime_set_active() of device_resume_noirq(). pm_runtime_set_active() is
only called for a device if dev_pm_skip_suspend() succeeds, which requires
DPM_FLAG_SMART_SUSPEND flag to be set and the device to be runtime suspended.

This criteria matches for PCI bridge. So its status was set to 'RPM_ACTIVE' even
though the parent PCI host bridge was still in the RPM_SUSPENDED state. I don't
think this is a valid condition as seen from the warning triggered for PCI host
bridge when pm_runtime_enable() is called from device_resume_early():

pci0004:00: pcie4: Enabling runtime PM for inactive device with active children

I'm not sure of what the fix is in this case. But removing the
DPM_FLAG_SMART_SUSPEND flag from PCI bridge driver (portdrv) makes the warning
go away. This indicates that something is wrong with the DPM_FLAG_SMART_SUSPEND
flag handling in PM core.

Ulf/Rafael, thoughts?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
