Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8C8BF9
	for <regressions@lists.linux.dev>; Fri, 22 Mar 2024 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711073889; cv=none; b=fbP1Zg5iGcixugdhc8V9ZV+2NuAsDpacs1j3Hts/gu/Xt7QC9a2b5zChVe/55bEKDdJPB7jL1ue8MDa2QA906oM3QCmwcJoaC3LfC0tAtkpkTm4l5Zaxfp1KaQsV40Rx0xQtHPCm/Wmk9Pcy/0LwPgladD1n0MQVvKt/fDPT9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711073889; c=relaxed/simple;
	bh=okMxw21g5ErPlSKWeHdG3qWKEX0bS7jcuyxPtq7fbow=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=lbfche20JBlIKy2Ivjz4FCMG4RXpJ0vjAnTSxZPc4FechYVJGRXS/X2kRBWWCJ1DHoog4ljmaM1+qDnErdXCPHrgyQLKZvZmhEMwZYuZx7ExEZITRMwyA0VgvFhcSYzg10YROTJdRddpw+z/w2npAwwTQLCJChCdgCjVSSyuPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=sLNd81jK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="sLNd81jK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-430ccb3d65eso12082111cf.2
        for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711073886; x=1711678686; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gmzu/tiA+wS1NVvzFexpqs83DytKPN0o3wMDhT4Zkik=;
        b=sLNd81jKGlrs/nftDstvzADO2uaOeDwWERG31ei7oOpOopFZx2h8gkeJ4T/63vPzoW
         Alk4shFT4/RDqm+F3W36+mh7E1LnY8LEi2PV9f1UUtgZAD8JQsFCXmU5gLq0dP8UGZGY
         xCeBtJTk68pEFbCkr5yWyDgSY2ati4dr++7gRH5Wqx1vs2eu+oenW+5euU1SGGMNTm59
         IaE8dksZrsR+8jf4+Ah02P6ahd4t88gBPnB5ATG7ELr5jAv01JgacHqYqgdlaZw7FUST
         wYC5PNS0QcgQm2xHJK+RGznFfTQ+11h2PoBFPcAxCH4SMLJ379/JLfstiAzONDurwZnO
         Q1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711073886; x=1711678686;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmzu/tiA+wS1NVvzFexpqs83DytKPN0o3wMDhT4Zkik=;
        b=p/PW0AhoC+Ug8vEE8jd/jpFN1sHCCZFz9vr5+2TWfcF6rahQ6oY7mMegbHU06awlM8
         0HzHED5E9NI9AkKF+wrJoTD+wXjRVd/iDculZ9PnE5CmEi9/lJ2bBzUWyVHXRfK9w6XV
         6AvsBiivMeQcp5WmZ0uzb8Ouu/QvDZ7fxzRR6OvUxXol+jdsAhTS4lbFKi03/H+H+nZz
         AD2WlavQ/4N5HpDwY/DgNFvMrwBRg0q3t3Au1AEh5Qja4UYChJmjjiN5JV65+ftknjFT
         F3LXjHshMJnwrbyIPu45VCQJZ6QlraE7G4opcnvWpHWs460U7wm7BYxmMSJ6b+uKgK7F
         CKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40UhslsnY5PDpgLdSTSW17jsXGvg4tA856gwYcCS+Hu8Xb0x4z5hBhOzvz3xB1V+WUEnYmXwQo+FpiEnwx81/FDwvqrSxBqKf5aI=
X-Gm-Message-State: AOJu0YwN0/j4kQABdmlQpSXmWSL04yrv+nD8F3MKoc5w5ugRdME3mGgO
	exjEqLGh8XLJmucppUNEW86FIBtltRFxtWimR89sCAMCEm5ngPEmwvfooPQlSVQ=
X-Google-Smtp-Source: AGHT+IGo2KkRpEpH0s6zMyPR+I0a2w2mAG9OV5ZW0444Xf0w3nwPQWwFn/u8EaOQg0zgGEkfIaM1kA==
X-Received: by 2002:a05:622a:4e04:b0:431:3069:4601 with SMTP id dh4-20020a05622a4e0400b0043130694601mr405161qtb.6.1711073886370;
        Thu, 21 Mar 2024 19:18:06 -0700 (PDT)
Received: from [192.168.0.51] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id bv8-20020a05622a0a0800b00430d8e11bebsm463840qtb.64.2024.03.21.19.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 19:18:06 -0700 (PDT)
Message-ID: <7c9b4c27-e179-c136-e327-4c467ece81a2@draconx.ca>
Date: Thu, 21 Mar 2024 22:18:05 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: PROBLEM: Linux 6.8 build failure in sun ffb driver (regression)
Content-Language: en-US
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 regressions@lists.linux.dev
References: <5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I bisected this build failure to the following commit:

  commit 8813e86f6d82a7931446c3cbc5d596f77d0f1ba6
  Author: Thomas Zimmermann <tzimmermann@suse.de>
  Date:   Mon Nov 27 14:16:01 2023 +0100

      fbdev: Remove default file-I/O implementations

If I revert this commit on top of 6.8, the build is successful.

On 2024-03-21 21:00, Nick Bowler wrote:
> Hi,
> 
> Linux 6.8 (and 6.8.1) are failing to build for me:
> 
>   LD      .tmp_vmlinux.kallsyms1
> sparc64-unknown-linux-gnu-ld: drivers/video/fbdev/ffb.o:(.rodata+0x270): undefined reference to `fb_io_read'
> sparc64-unknown-linux-gnu-ld: drivers/video/fbdev/ffb.o:(.rodata+0x278): undefined reference to `fb_io_write'
> make[3]: *** [/home/nbowler/misc/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
> 
> This problem does not occur when building Linux 6.7 which builds successfully.
> 
> Kernel .config attached (gzipped).
> 
> Please let me know if you need any more info.
> 
> Thanks,
>   Nick
