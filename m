Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE51361
	for <regressions@lists.linux.dev>; Fri, 24 Jan 2025 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737695720; cv=none; b=sSptwloT5/ok+TYYLx7EaIgW8fbjysVHrig8TkfnlMk8kOAuPiSDPc6t/MTVlRzZxa6ASZ9sw7BWW0YmVI8fJ3/3o2WKPq9ZsZX6BAL0bYUD4CnUwMQiAn37C+HZ7JJB1iLayROrIfLxHc1K/ZjSdoTrBC8CpjpSsxqQAqvSwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737695720; c=relaxed/simple;
	bh=C94Z0eniOrhY8vfSK2Shz75ZMGzMu8k4tzHOc3eDo0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwxirnfYYMniwggesR/NRVFLWn3XijZZ7zjyhIXY+sEGIWihv/wWkUcbA+B3qAbu8wkBA+Q+pkZlUb9p+RafQqV5iM4a0VaKThQpzSehn41/quTAutgz/FnyuxwPOq8r1CtAJ5XKAFSIHkvIQk40iJgkGZFlMoDbuFx7CSwO3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mQzLT/Ez; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mQzLT/Ez"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21680814d42so27631475ad.2
        for <regressions@lists.linux.dev>; Thu, 23 Jan 2025 21:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737695718; x=1738300518; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5V8IjvQyQoDv88IF/KIjDx1xtX5os/gbeTbjuMxwHYo=;
        b=mQzLT/Ez71vCvycGuN/h3nKXdXUOT+TtDXpsILVMyqrP16qAOZkPDxYOBRhssGX3Tu
         DFIiV4R1G7534Q7ot3vwz7yNewAVXDHSSyWBomD0ouXt7INWmhNfJWeRmSIyN8lJB01i
         esEvT2NvfeGE/oafFmW8P4YmhJLzP9wxES9TLMEPj7aLhFUdTnlnAoZZxkgblCL1F+pu
         kyABStrzXpW5ZI4hTvECSoshcAz6JGtFGohi2LbH4xmEA7fELxigVxHJEuNF8jrqiWBY
         zSYIbQVk8k/FPhtTC6ORPRGpuEw5wi5cSgZUVV74bFYkhgGa4GpfCIqeKOlChbqflPbR
         yUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737695718; x=1738300518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V8IjvQyQoDv88IF/KIjDx1xtX5os/gbeTbjuMxwHYo=;
        b=lBx37EgezRpvsf/g19sQzZrw6GquVf1WFZLgGWU1VWfEQM/E/DMwbRDA7Bx26ohI+6
         sren+iAhWbYKtlOpZndJSCoeszziKr7QO3C7q+otJhvKKVoiHWUtu2DWPFlWVwQOt8Wd
         8dEqYtUz6THCgdeYCyZIMJ797sfC3Rm+CJhcObP9zQAtU5F17sbTsYtmiF35yOVKKot6
         W/PwpGicnPipfIVWAfC6sCuhmStExdXZ0xPOFVJNJuRjfcb+GFNyyzafe+b8SobRe6Hs
         TCqPwoCirHrPtW/EHUVnswCXFmvo1jC5Y1M/ZIgI8ATlPRi3UfDsFK0OBc3WmoIhCyoh
         af1g==
X-Forwarded-Encrypted: i=1; AJvYcCWtb9u8QFRhYqe0U25x5hyFImLZhsLadLD5t79WmqzHMJLNquJW+PLzU2MpQzgE9jJ8stf9i7rFQ0iEpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaLetKCkpP5Ln9ShV9wxehU4Fuqua/t/Y+t8dFdaVJ1nktYdzc
	JJhn3J51rlrO+MFfmt3MCF+4nqCq81Ys9+XLqG4yHcVTAtkU4aSRHWfK25Dm1Q==
X-Gm-Gg: ASbGnctl2WLWnOE8ahl+PZfs2r0d7XaTtivoTaFE0sQQaRhhnXe6YR1K2Im1VQUzjur
	IovlceeHGrFfYcMoPjvLBsK0OZ+d4C03JVunP4xcOtlo6IuTIUNJRJrQaWOaX1+36y+Cu1ap0uG
	e26kD/FrLpjiP02vcPKmDsXLOx5V1IBEXz8vzlWZmBCs74D9mlZA0r5bij70P4OjuOygMswE+Lj
	A0dM0AbT73hMtjucBMuunfJ3fhB0pz+Z4HiYUSqs0JP9kusyBxMrSYz2+ZCe9VONXmf3BHGsuaX
	kze5jBDGAq1mpPI=
X-Google-Smtp-Source: AGHT+IEDPeDAS7uVIV0ZkrrydW8dzxtvB6pScgknE489KkEpgCZmqJC4AgG/7nH7vooXPlAoLJr2Sw==
X-Received: by 2002:a17:902:e54d:b0:216:39fa:5cb4 with SMTP id d9443c01a7336-21c3556155cmr444408595ad.25.1737695718282;
        Thu, 23 Jan 2025 21:15:18 -0800 (PST)
Received: from thinkpad ([120.60.136.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea2844sm7898155ad.57.2025.01.23.21.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 21:15:17 -0800 (PST)
Date: Fri, 24 Jan 2025 10:45:09 +0530
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
Message-ID: <20250124051509.djzjoml2zcq2xvvz@thinkpad>
References: <20250113162549.a2y7dlwnsfetryyw@thinkpad>
 <20250114211653.GA487608@bhelgaas>
 <20250119152940.6yum3xnrvqx2xjme@thinkpad>
 <Z44llTKsKfbEcnnI@hovoldconsulting.com>
 <20250120152829.7wrnwdji2bnfqrhw@thinkpad>
 <Z4-eufq4M04XHjck@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4-eufq4M04XHjck@hovoldconsulting.com>

On Tue, Jan 21, 2025 at 02:18:49PM +0100, Johan Hovold wrote:
> On Mon, Jan 20, 2025 at 08:58:29PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jan 20, 2025 at 11:29:41AM +0100, Johan Hovold wrote:
> 
> > > I'd argue for reverting the offending commit as that is the only way to
> > > make sure that the new warning is ever addressed.
> 
> > How come reverting becomes the *only* way to address the issue?
> 
> I didn't say it was the only way to address the issue, just that it's
> the only way to make sure that the new warning gets addressed. Once code
> is upstream, some vendors tend to lose interest.
> 
> > There seems to
> > be nothing wrong with the commit in question and the same pattern in being used
> > in other drivers as well. The issue looks to be in the PM core.
> 
> After taking a closer look now, I agree that the underlying issue seems
> to be in PM core.
> 
> Possibly introduced by Rafael's commit 6e176bf8d461 ("PM: sleep: core:
> Do not skip callbacks in the resume phase") which moved the set_active()
> call from resume_noirq() to resume_early().
> 
> > Moreover, the warning is not causing any functional issue as far as I know. So
> > just reverting the commit that took so much effort to get merged for the sake of
> > hiding a warning doesn't feel right to me.
> 
> My point was simply that this commit introduced a new warning in 6.13,
> and there is still no fix available. The code is also effectively dead,
> well aside from triggering the warning, and runtime suspending the host
> controller cannot even be tested with mainline yet (and this was
> unfortunately not made clear in the commit message).
> 
> The change should have been part of a series that actually enabled the
> functionality and not just a potential piece of it which cannot yet be
> tested. Also, for Qualcomm controllers, we don't even yet have proper
> suspend so it's probably not a good idea to throw runtime PM into the
> mix there just yet.
> 

There are multiple pieces needed to be stitch together to enable runtime PM in
the PCIe topology. And each one of them seemed to be controversial enough (due
to common code etc...). So that's the reason they were sent separately. Though
I must admit that the full picture and the limitation of not being able to
exercise the runtime PM should've been mentioned.

> But, sure, a revert would have made more sense last week. I guess you
> have a few more weeks to address this now. We can always backport a
> revert once rc1 is out.
> 

Sure. I've pinged Ulf offline and he promised to look into it asap.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
