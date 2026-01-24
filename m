Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0ED7081A
	for <regressions@lists.linux.dev>; Sat, 24 Jan 2026 01:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769216499; cv=none; b=sbaCaT51uOB9C7G+RQA600v6gkvNM02EC5nAWxKgeZ+dZpL9CPBJxXsdX9M3mFynkZ0M1ZZpkPfAB4fPymma50qxSHz0u/iNFFkNUr2sC53Fm2ZKcoI2Of3IyfynUYF7rf19JGz/lhJqTDCbOvWcJESuvb06kRe040BECZbsCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769216499; c=relaxed/simple;
	bh=Uw3p5i44k2QerDdHC5srVRssQUggLMKwMShZthEOWnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siMaiJcsqIfeNFtzGlGIjk6m589WIAv+HFfQdCHXHCllOVSTOrS5+4/nhI+3wrHT7xu55bO6M2gKNVFoUDtr8lG2EKh3YfNns0Y8HUlt3n7z80Qz/0pmBeLI+BK8yIODmuT119ieOMLoeUao/vpoTYjjyKljwkf0CkmVfXNffuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N4tgz3RP; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N4tgz3RP"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-29f30233d8aso18604075ad.0
        for <regressions@lists.linux.dev>; Fri, 23 Jan 2026 17:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769216497; x=1769821297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VLK2dGoIOaI5P+vEmyO0jLJyhpsACr0pjnnbpkW/HIM=;
        b=fADw05HlSKzU6TyZtwaSmpLJPlCEY0qspSJCqoqmP4q8K2z4u/QXmRGC8H6aLV6BPN
         RDMtfQfyhRMbhpx/OMua2q9+Gse2Pm9rNquoCpiy+4jD0aADRIFdWXTo11IFfFLcevQo
         2haGADx/kvnhQ0MRJ1tLxUtDoK60DXSA1dcr0ayH+X2f/NUh9XLI0aRGC83eoyFB+qTk
         W/oWJcLX868TkpAH18mPcDJDgsxx+HJkhOCv9NCivj9WiEyj56rSjQQCa6ndJVcDril9
         EMTR6TEyut5BEUUxWKEnCyiGjVv5k6+zjuhtplKleQja2aX0FzwwYUUOnXXeu9qQWytH
         sZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXWYsxFnyHexn80mJ6745y24Z18ErC0qU8kU6pTu4txT9fZjBSeq4DYjJ/jEMn9Fa3UpTxznpun7N2WCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWOSW3wtk2Kh94KPE7VYIDTZdRFPexd6Wo2OjmYu2EobYA8nlt
	+MIfeCtJfnRIll33sYbUM7Fsiu9bpTVdNwMtU79rB9pAEY5JCzGw9P0MFZSHC8Y1KTfD6JN0b+I
	jpl3rFpmMsOWwLCDvZKV8cpBAL/ota1GnhpMPoLGjIUxErkp+e5aYsZ0mdR4Yd+++xM7nPngfMt
	0CAscgHk0bH+We0vviEf4rLM+yngFMwn2/lF2/rnQaqGL6YvkSEPgoaI0P/lNNcSbKyLwa2iZVz
	yPSHUb0BhLhlY3v/hd8hg==
X-Gm-Gg: AZuq6aJL6RxMzJsWA7yGlTbccDlz2GkUixxAnCyOnaVdNFlpXcMo7hx0Hx77jHPWUuc
	aQEf0uVEMiBy8myjjyHKczQWZ15A6ioG+4xQ22yhG5D1gFP8YPQ3jW/qmYoqOP1/8z0xX+JyWmm
	LYFFpFDoxYTV8MWGG3JBsFO3yX2KTLQ128WRpgIYq3qUPgqr4aIrOugDH3DY8xn3704D5OgjNsU
	f5PFLvwR1gqBot870+4KBROLjVAqwR2vN6XIO38ltY5uFRb4vVOh5dCOYXvq8P5D6ZK9SEolyWR
	CJM0DYvpJPxTLwssrh0z8Z/sk6CEmXlZGAsvzWlZAdWDMjR+C8nxFENAGSuM0TekNbIc7V/60jv
	NoJtxmwFFlYWbYVPGkXoa8cVK/8RfePcVs57tP5C3a6ocEUvrpb0vhW7HJEW4GH9zbpzj379pi6
	v5lfl5OikDcFW3YxvEVfnem8Z3XCK9rSiOiexDRHA5pzt9Jfb6
X-Received: by 2002:a17:903:32c8:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a7fe75689bmr47670715ad.55.1769216496800;
        Fri, 23 Jan 2026 17:01:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a802da47f1sm3683915ad.8.2026.01.23.17.01.36
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jan 2026 17:01:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d14b9caf47so7095225a34.1
        for <regressions@lists.linux.dev>; Fri, 23 Jan 2026 17:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769216495; x=1769821295; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VLK2dGoIOaI5P+vEmyO0jLJyhpsACr0pjnnbpkW/HIM=;
        b=N4tgz3RP3GzpQRFPeaMujZ+YMsIm6HUWKVK1Mj3p2ZHSMqhAPX19DoYjSanihoMKpX
         n1Gn4hgNBgxQwV0MHPO0Llg56H048Zk9yRWmF1XztiNMzF/wr77ydOx8eRlPuLp5TqKs
         sB4quk+GiKwJ7rLnuAUII9ELyGKXTRQ13dGm0=
X-Forwarded-Encrypted: i=1; AJvYcCXsbDtK/1kTx704UfDovFcaHdtnWqIdmoF6jMj4OYX2PkoOKFq0drkPAsdIJGqSUPov14lUA0/lgitLOg==@lists.linux.dev
X-Received: by 2002:a05:6830:4907:b0:7cb:1287:e3d4 with SMTP id 46e09a7af769-7d15a6658eamr2675639a34.36.1769216495206;
        Fri, 23 Jan 2026 17:01:35 -0800 (PST)
X-Received: by 2002:a05:6830:4907:b0:7cb:1287:e3d4 with SMTP id 46e09a7af769-7d15a6658eamr2675628a34.36.1769216494844;
        Fri, 23 Jan 2026 17:01:34 -0800 (PST)
Received: from [10.66.193.70] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d15b3d3340sm2997605a34.23.2026.01.23.17.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 17:01:34 -0800 (PST)
Message-ID: <9c491fa6-f59d-489e-97ce-b364ce76af73@broadcom.com>
Date: Fri, 23 Jan 2026 17:01:31 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Zack Rusin <zack.rusin@broadcom.com>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 1/23/26 1:47 AM, Thorsten Leemhuis wrote:
> Well, fixing bugs right where they are obviously is a good thing.
> 
> But well, the problem according to the description quoted below was
> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
> regression that must be fixed in the kernel (ideally before 6.19 is out).

The Linux change 34bf25e820ae ("x86/vmware: Introduce VMware hypercall 
API") that revealed QEMU issue was introduced not now, but back in June 
2024 in v6.11-rc1. Two LTS versions 6.12 and 6.18 have it.

This issue can be triggered only for specific hypercall (usually 
statically inlined) and _only_ if compiler keeps rsi/rdi in use during 
the hypercall.

The proposed kernel fix forces compiler to use memory instead of rsi/rdi 
registers for _every_ VMware hypercall. Every VMware hypercall caller 
should pay a penalty for QEMU issue, even if it runs on non qemu or 
fixed/newer qemu platform.

IMHO, user who faced this issue should be given one choice to fix it - 
update QEMU as the system may not be operable with this combination 
QEMU+Kernel.

If kernel colleagues still believe it should be also solved from the 
kernel side, then my proposal is to perform precise fix by using wider 
hypercall just for VMWARE_CMD_ABSPOINTER_DATA:

--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -145,7 +145,7 @@ static psmouse_ret_t vmmouse_report_events(struct 
psmouse *psmouse)
                 }

                 /* Now get it */
-               status = vmware_hypercall4(VMWARE_CMD_ABSPOINTER_DATA, 4,
+               status = vmware_hypercall7(VMWARE_CMD_ABSPOINTER_DATA, 
4, 0, 0, 0,
                                            &x, &y, &z);

                 /*

Regards,
--Alexey
