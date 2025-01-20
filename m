Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868861E5710
	for <regressions@lists.linux.dev>; Mon, 20 Jan 2025 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386920; cv=none; b=hyJBEAFAiCejuC97qCFs0AzHiWHf9bzF9Q7/qaQc6SFRtBXm3GfE6tShw/S/Brfx+sI3KgfXJz6u1wfkdNTY4kROjw9S5GG+Mj1GxJ+8EJzAGVEOCIkMX6cttAKLTMb5lsGq1JjJTNK10j/P1B+WBYnKM4IdyRKaPOlMx9JZaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386920; c=relaxed/simple;
	bh=VAWkKFMuuvGFwc4lV9U8KFWWhfAs+x3tBpzqXY33AtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2BcQFc4kLe2pBSiLAVzJxQQemrwo3jSQuS79SOUGFIGuH1dB4wjBcxCQbiR0lVQDWXkrp5p6ya+xDjGorEYodcnuqfdqrt5SO1XBvycKbmuOK5kHLQdmm0Slc3mGxLT6I+U5xbOgxh1o1Qi1cH66x2iTa0nVKtXbmURJE6GJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QlP7XWIP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QlP7XWIP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso109571925ad.2
        for <regressions@lists.linux.dev>; Mon, 20 Jan 2025 07:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737386918; x=1737991718; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ge/AXIemwm1awQOTNlXpVZkK91To9JlcVieMAvqiKWA=;
        b=QlP7XWIPGSyNcoHfJaCPw9Df90RjpoYLUbmviqxhzJRnyxrBqUo3l93J4ePmk9GKCX
         gYXbPePXonlYQmQfqIS2urzYe2eao329qZ0GyJxm+4nQXO41ncmU4c/XjQsRjxKya7l5
         fxBrNK6VuSMgI8r1ft9yIcvz89lavRmYlzTb/c0VhgzId4wW2Mm5nX4PzwqCXbSBYWum
         CykDgEBpFpjl+KCpOsQBcE4ADltj+etLP7WSoeT450G59GZCwHTOFvxQmh4mI8UfaBoc
         1HsL8YGFZEaZhFOHgveJ6wf/t+vsOYea2A7vXMSpP/6BMUKYXzpObFBMvrgREo2pyVUr
         7FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386918; x=1737991718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge/AXIemwm1awQOTNlXpVZkK91To9JlcVieMAvqiKWA=;
        b=KaspfXtQC0A3KNP2s4z1BIi8Cg9xeA+6fsvsOj0B7FljucNywlC9id+blqgwStLXov
         IWukEiEcyt8NZ1Jqd8TDRW/9thBWXnq4VmoOGGUVqIE3SLvdQENzExO2eABEkusWO0x5
         AfCRjMMwgiTW4clQRmZ3hO0Sj1TA9fGOtEryPiA+YChqUhsNSHihmcHhl0WaGfBxERI2
         mzf/j4Nt607wQ2cBjqc/KIWVjIU7uvQ4bVjEVK0PO8OoXk+GFvPFGxhpOeX8xqeo+Yua
         jNL8zgeLf4j1AIr3LyBFEfDVHJM++aPEnaBcqY3oUEoVDf9n8PLk9opBDHUprb8u9moz
         6FhA==
X-Forwarded-Encrypted: i=1; AJvYcCV++y00T4vZfWOocff+OBQW+P5f+il+aiKmoYFne5g8gYzpg9vo4Jk0+6pqu3DAdsDXVNtPKDUHJfygdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfdhIUVNvhv/1aS19COm5ByBgiIlOBfHRgokisVB5YUrbZRysX
	iMIDk9n6HjVGc5f0T514Nim558PWTCmoaqxh5LXSC9bLVNIZlDiq4JP0jPd86w==
X-Gm-Gg: ASbGncv6KnvgebttBioz4wuGMiqAV3M0AWT/mfvWrZ7442znewzMpLCfvHsbaBys9Lr
	YoiXBqo70eYlrjU24Eb+tVoeHHEvKHFvVZV5dDnmC8rVclIU+umvc9pexpKFI0+HWkMVfXNqz8y
	Sge1aRJh9huu4Cg8+Rr0DWmnKBMknKYpbIy3Ostg/LTiQRh3i6pnWADVtqzU/n8CZ7Lttu5vS0P
	ViABRzuhm5rdSQ13hYuS0TYRyLEcFUCfezuAto8/kR88XKkCKrJZW6id2OH/EtraLQxuWNLogrF
	dF0vPMo=
X-Google-Smtp-Source: AGHT+IFEYzzBuALfLBnZY/0Oioq2g+BcnanbnfQw4KIaV+WjpwymnqzEgNX6z1yArWAvcbtux5os8A==
X-Received: by 2002:a17:902:e546:b0:216:281f:820d with SMTP id d9443c01a7336-21c3553b6famr223740225ad.11.1737386917771;
        Mon, 20 Jan 2025 07:28:37 -0800 (PST)
Received: from thinkpad ([117.213.102.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea2caasm61864755ad.51.2025.01.20.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:28:37 -0800 (PST)
Date: Mon, 20 Jan 2025 20:58:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	rafael@kernel.org, ulf.hansson@linaro.org,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Markus.Elfring@web.de, quic_mrana@quicinc.com,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v7 2/2] PCI: Enable runtime pm of the host bridge
Message-ID: <20250120152829.7wrnwdji2bnfqrhw@thinkpad>
References: <20250113162549.a2y7dlwnsfetryyw@thinkpad>
 <20250114211653.GA487608@bhelgaas>
 <20250119152940.6yum3xnrvqx2xjme@thinkpad>
 <Z44llTKsKfbEcnnI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z44llTKsKfbEcnnI@hovoldconsulting.com>

On Mon, Jan 20, 2025 at 11:29:41AM +0100, Johan Hovold wrote:
> On Sun, Jan 19, 2025 at 08:59:40PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jan 14, 2025 at 03:16:53PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Jan 13, 2025 at 09:55:49PM +0530, Manivannan Sadhasivam wrote:
> > > > On Tue, Jan 07, 2025 at 03:27:59PM +0100, Johan Hovold wrote:
> 
> > > > > > > I just noticed that this change in 6.13-rc1 is causing the
> > > > > > > following warning on resume from suspend on machines like the
> > > > > > > Lenovo ThinkPad X13s:
> 
> > > > > > > 	pci0004:00: pcie4: Enabling runtime PM for inactive device with active children
> 
> > > > > > > which may have unpopulated ports (this laptop SKU does not
> > > > > > > have a modem).
> 
> > > What's the plan for this?  Does anybody have a proposal?
> > > 
> > 
> > TBH, I don't know how to fix this issue in a proper way. I need inputs from
> > Rafael/Ulf.
> > 
> > > IIUC there is no functional issue, but the new warning must be fixed,
> > > and it would sure be nice to do it before v6.13.  If there *is* a
> > > functional problem, we need to consider a revert ASAP.
> > > 
> > 
> > There is no functional problem that I'm aware of, so revert is not warranted.
> 
> I'd argue for reverting the offending commit as that is the only way to
> make sure that the new warning is ever addressed.
> 

How come reverting becomes the *only* way to address the issue? There seems to
be nothing wrong with the commit in question and the same pattern in being used
in other drivers as well. The issue looks to be in the PM core.

Moreover, the warning is not causing any functional issue as far as I know. So
just reverting the commit that took so much effort to get merged for the sake of
hiding a warning doesn't feel right to me.

> Vendors unfortunately do not a have a good track record of following up
> and fixing issues like this.
> 

I'm not relying on vendors here. I am looking into this issue and would like to
fix the warning/issue on my own. That's why I shared my observation with
Ulf/Rafael.

> Judging from a quick look at the code (and the commit message of the
> patch in question), no host controller driver depends on the commit in
> question as the ones that do enable runtime PM just resume
> unconditionally at probe() currently (i.e. effectively ignores the state
> of their children).
> 

Right. There are a couple of pieces that needs to be fixed to have the runtime
PM working from top to bottom in the PCIe hierarchy. This is also one more
reason why I believe that the commit wouldn't have caused any functional issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
