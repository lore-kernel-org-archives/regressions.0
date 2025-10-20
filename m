Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626A21CC47
	for <regressions@lists.linux.dev>; Mon, 20 Oct 2025 22:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760999612; cv=none; b=BhFoGl9/+pU0chXmYBrlRqFgaVvhqrr2FaUYvjhe1pNIcgUbFiN/ElifUGQKz0YB2mMTWSBvlPQJ7HUrRmT0VzMPX6HfKsogCpM1Lu+iXCnV2NqFenMV7wlo0q6FeaAGNipIpMgISq1HmTybfEF8ZpkDdsYifTYeVF26WinopLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760999612; c=relaxed/simple;
	bh=bIrTZvMRG1iWWic9WK5zbL7tmweu+85KbbrWy1ujtlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVBgXZYRZZ+VG3kTSsnSlnLI3RSJRrPDZXdeUcKJ38SSO1dJAbKiG9Xwx4VwXsee0ZSNBliC8Nde2auvu9+/622etIYzXh2fu3bTTXb6+GwZZ+U+eMaNB54IuaSgX+QdMgaxoBqN1Z3jVbx5YfhE0n0xMDWXM6GSGLd5q0QMQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so523223f8f.0
        for <regressions@lists.linux.dev>; Mon, 20 Oct 2025 15:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760999609; x=1761604409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sI46IxLQenYe3Bvaj7MAwN4y+wiSHGhgl4BxzQDCKn4=;
        b=mH8W5uibqJBGXIONMQTJzaplyLK2GUuaCXVQM0VNABBZyw81G5WmGI8kz86447pPt3
         SwuaKFwZ1UvpWuvHx0GVanXFOCTFZsjwfBdLZwrvnojRsWn/NJxvEC6R9RQUbYYrazFC
         +KnWc65YbAQpnd/eRLWJ2AfuE25z7zPkYDG/8CJeSzB2Z+Nq3tNiEmdtyK4MdEkNMxzI
         9oiGBlBOY+UlrspfjjUp6vL8ZhCrXXY/5BHfguCT2yos2HVXh8DmNTR6x8gPqHJgCY6H
         9uko6rEpvj2yv6jk0suV55F+cyBf1i/UvxSb0mF5NV+TzKsBq40jHi4UkTd0Pllf+tWq
         P6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpRW36NH0WSy14NQuPwkmyqqbkTsvEkhA1IwXjHLE5UBhOijjozdbLLfn6/sJbx4fMHYlwmksHFEDwuA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpsdmvue/R60/lQLoZJMc9N0+IqyqkEeM+ViribnfuLfgo9v9J
	r3/iN6PL2sTUA/SID2QKaigOL0S6wieE5PMo+UIxdaKrGaeKt6SJoCrx
X-Gm-Gg: ASbGnctqeLyim1u1o8Kf/JVDlYP/+F18HAls5xduWbW7iPBcGHAH4zy40ah/BUoDdUo
	pOorqmIPKgCY+2r6DYMrseWRRLD5auFp4RmBeSMN+7rsPHTiHMhAxXMwmhFrtn8LXyCqQ0a5XlM
	lJUB2CbMBVHMF6v7kWYePIeLQvZUfIDcd6VB6oeYdKpRLvaI17bJkxhCaDd+nVGUtF+kMrdMVeQ
	y77ta4WQu7AK1mW3JtryLkWsiuUn2NaJbKd/9nLxb44uSMZVc8yIbqL+LasVPcTlMj6huWSbtxr
	sJFE0scTOCRESSKyYj4c49K8A54Wr4SnniyisfyxL3e06Is3C+8kkjhLor+jzh5FS9grMtilixu
	JS/eKV6MXMsglIdPe1U0LdqmwUcH48aLY+bLpnvwUZSnWd3FNIgTUCw59clPfIwTFY8M667Gor6
	r9jU+fPEiDHKn7VEJZEZnmtzOTAjpN49K/RQ==
X-Google-Smtp-Source: AGHT+IETC3F/wmABgyq8kdA8EKubbpd94Rne05MH09yrcJYq/6GsCg9RKL7l5prbblzw8dt6ayscbA==
X-Received: by 2002:a05:600c:3b9d:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-474942bf7b2mr6296375e9.2.1760999608823;
        Mon, 20 Oct 2025 15:33:28 -0700 (PDT)
Received: from pixelbook (181.red-83-42-91.dynamicip.rima-tde.net. [83.42.91.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c43f68sm2876555e9.5.2025.10.20.15.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 15:33:28 -0700 (PDT)
Date: Tue, 21 Oct 2025 00:33:25 +0200
From: =?utf-8?Q?Adri=C3=A0_Vilanova_Mart=C3=ADnez?= <me@avm99963.com>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, regressions@lists.linux.dev, 
	linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] Intel Wireless adapter is not detected until
 suspending to RAM and resuming
Message-ID: <qbnpypp5uiowzuq5v7tqr67ptx2iv56pvmcnr3jmf4yxvhrvzf@auo7cmgtgbmd>
References: <owewi3sswao4jt5qn3ntm533lvxe3jlovhjbdufq3uedbuztxt@76nft22vboxv>
 <d0b6105f-744f-40d9-b4b7-1fa645038d0b@kernel.org>
 <h6wkxjrkxh3ea5aqexqrx4d6xb2t2xbirvznupnbgro64qytfs@mn2jg2c6owrj>
 <rvep55wtk2q4j46eqcxkfgb2bwijunefyltygfyb44trbzblx2@3ou3jcybjt3p>
 <6b3d282c-b3cd-4979-b26b-ae9b28b9d634@kernel.org>
 <kaieqe37mjmizjv4regyw67z7hwa3ac3k2mwcjsgq2mj7redpm@xsfb4mtyjblf>
 <a08c71e2-18ca-491b-8982-47214a35445b@kernel.org>
 <lpntymy3w6ryvyo2trpqkl7i3aibofzqcp7p5jhxjlkse645iq@fepikfj4tcyk>
 <149b04c5-23d3-4fd8-9724-5b955b645fbb@kernel.org>
 <60380893-c323-4d4c-a9a1-d43fcb4da1b3@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60380893-c323-4d4c-a9a1-d43fcb4da1b3@kernel.org>

On Mon, Oct 20, 2025 at 12:38:05PM -0500, Mario Limonciello (AMD) (kernel.org) wrote:
> 
> 
> On 10/20/2025 11:37 AM, Mario Limonciello (AMD) (kernel.org) wrote:
> > 
> > 
> > My interpretation is that the BIOS by default starts with PCI PM
> > enabled.  When you test without 4d4c10f763 and 907a7a2e5b it will stay
> > enabled.  But when those commits are present it gets disabled when going
> > to D0 and that causes device to drop off the bus.
> > 
> > How about with pcie_port_pm=off instead of pcie_aspm=off?  Do things work?

Nope, pcie_port_pm=off with a "bad" kernel results in the same issue,
and lspci still reports this:

        Capabilities: [200 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=40us PortTPowerOnTime=44us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=40us LTR1.2_Threshold=106496ns
                L1SubCtl2: T_PwrOn=60us

> > 
> > My current thought is that the change (setting to D0 explicitly at boot-
> > up) exposed a bug in the platform.  But the fact that it works without
> > ASPM is confusing to me.

Is there anything we could do to confirm this?

> > 
> > Bjorn - any thoughts here?
> 
> By happenstance I came across this earlier.
> 
> https://lore.kernel.org/linux-pm/aPJ4pZFENCTx9yhy@google.com/T/#m55aceae9153a1aa195635fe48aadb0888c795e49
> 
> Does that help by chance?

I tested this patch and its v2,[1] and none of them help.

Again, thank you so much!

[1]: https://lore.kernel.org/linux-pm/CAJZ5v0ie0Jz6AJdZJx2jNSRcqRQOqMCF+gYdgemTs=rKwXD1_g@mail.gmail.com
