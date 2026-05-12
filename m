Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F939389DE6
	for <regressions@lists.linux.dev>; Tue, 12 May 2026 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622233; cv=none; b=Nw/SY5H5dlzZQwSA37jaWX70LwYWw1SfJLu00grri/VnpmOM4FFP4V1hTb9WhWTnTNAKM2WmuyRp9ztT/gEohvTnoaqQeBEcixXHV1AM7ZaBRV/KpWq/IJq8SXg1peFpIRgzmE8qI4obKEr8gV7g/1GZrsjJHQkKtJoOx6cLobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622233; c=relaxed/simple;
	bh=+TVkWqui0GoSvFUjZQX/OAkYaopZk2awnHkswxWIKJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PY5g2L2HEd9nFemLGmadzBurSvmXU46MhHUdblDALvHzkbU1+9dmp34SwydRmg8tDNDEBJKk8ZF0Xl1AfLoWC5XTARC68CBOa5qx4X6FNjwit++wvqm59EQhQEP+mc4NJ6FEJ3VZk9mnja8Q0cd4It6ega6k89mZsJgG9oHscl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foQsr6OC; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foQsr6OC"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ee990e8597so10342751eec.1
        for <regressions@lists.linux.dev>; Tue, 12 May 2026 14:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622228; x=1779227028; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENfghvyJePtUcbcYUBfCy8Gb5BU9pVX2Sr9eVZ+IT9w=;
        b=foQsr6OCME8jcBLzYLiMnuJHYiE5O5RFNGwjA8z5BZGRJ6PxZQCEaNNDhSDdLvOvoA
         oo853eij1KEF98KjI03GJpHn4Hq2L83GSQM4x9VgYSXAGawvocFrDE9f3TIGuwxYAtrU
         6RxwKs3apPQozpLDpvAXvA/JGRUD8JNjbXy56d4wlNU/+vzxTFoUXh1L5Y/QCKYsj+Da
         7UF0624yYJb9Xzf1G0Ef8n4DGIDaVjGBJyBmhXKPBDHHIFnhV/EtGPwbadMdM03DmxFO
         IOxI+TNpeWvqOGl54U53Pa2LP7Nf2Do+yL5k5TcYE9/X1sgIav6UJVcz/wQtYTf12dVY
         ABEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622228; x=1779227028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENfghvyJePtUcbcYUBfCy8Gb5BU9pVX2Sr9eVZ+IT9w=;
        b=bq6oUtOBDl+D6WUuMZ2LwwSRRWhmk8578/ZOVt7L1LKUoIRB8s/0mnym9NiBhfeHku
         42JEXarYhr5Uq95eaEWgyfDg2DX/qIYxXWPuDVH/7D1G5hLfHf6R+pEN8AWgq19HXzyc
         BNHPB/39rO+Mbi4lDKglpbQIbYqtmJ7LhtBCzaBGFo9ySeovYm4K/Laz/QBPrhwBhPTE
         hIMYehOSM5u3YI2Xs6ZyXBF2aOmycL/5mYFlEvkezS8COFyBKTnIkzbLUQtFCPZ/BnJ9
         ORASMsqb3Qa+gfah9S/3/cGP4pudNRqi2LBX1A+3ZQe7AUD679SvYk30LkEtxcZKZZre
         wImQ==
X-Gm-Message-State: AOJu0YyTSeP+DiTfFgpLhjdGnQCRDAV5K3Ru58hWVzs6mV3rpWwcQl0w
	J9y7N4NOLS9l8RLHO++Dno1L9HaWyQWxBhVI8TSlgWl8VK+LRbXXZ0pO
X-Gm-Gg: Acq92OFqHdUxergKig8zl53rqFglnlv20V2ZrOrdFR3HHFQayaCo16r4WxklSMpjLtR
	icuOOuSJM7aSqYhdNf1LVk6YxHDDsVvFBp8xhYm8/BkbGeWP/Dpcdl4M8tifFLCgYvW/JPX2lqv
	Pdnbt0wIoEoqCsap/UElsHyT+WiO+4UvSUrfkd9KBbb+EFoopqPYggoZfRfijgnwPQubvtizAzK
	zIVEf9r0FOh+hupR2PvNjZvhI2n6VdSCQEgYqX7YZvgKAX6r8BAePMsFizE0OLNc2e9Iehd2jhJ
	AKLfWzyYEivrP3AEOZji/6gsGMfHrvbwHx41SFqRceSzgDLohdvgBYUmcUm2yfQs1Ofo0OA7Dot
	zloPApqdjaO8RxCSyU/imASDdZp18R5ZuwskwCVIdGvMzQRLBwvZlnmmQio18lar9z43CssmB/j
	7hjTWHOB+1LH7st24QG1lZ5rhw9Ele7w==
X-Received: by 2002:a05:7301:2a29:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30116f8cbf5mr513224eec.7.1778622228454;
        Tue, 12 May 2026 14:43:48 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb034sm19704759eec.5.2026.05.12.14.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 14:43:48 -0700 (PDT)
Message-ID: <64f465ca-6117-4375-9c4b-af771b8205fd@gmail.com>
Date: Tue, 12 May 2026 14:43:46 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: the stuttering regression in 7.0: should I have done something
 different
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <ffb44522-f01c-4be3-849d-27dc17fbca7f@leemhuis.info>
 <D5D19776-C809-4284-9417-F9A860877B98@gmail.com>
 <1c165caf-36b4-4673-97fd-ed86bef17b88@leemhuis.info>
 <3332123b-9e11-4895-9ab3-1707fba5815c@gmail.com> <871pfj9cmj.ffs@tglx>
 <a7a0d78b-435e-43c8-b436-5e7f4dd39dee@gmail.com>
 <088e6cfa-0167-4748-af6c-458ade2f303a@gmail.com> <878q9p82je.ffs@tglx>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <878q9p82je.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/26 1:17 AM, Thomas Gleixner wrote:
>> [  249.004209] [<0000000000000000>] 0x0
>> [  249.019116] Dumping ftrace buffer:
>> [  249.025666] ---------------------------------
>> [  249.034534]   <idle>-0         0d.... 1836659us :
>> clockevents_program_event: Successfully programmed 4000000 4000000
>> [  249.055418]   <idle>-0         0d.h.. 1845926us : timer_interrupt:
> So this is the interesting part, but that's starting at 1.836659s
> while the actual problem happens ~120 seconds later and the detection
> takes another 120 seconds.
>
> Assuming that one of the CPUs does not get timer interrupts anymore, the
> trace of that CPU should end around the time the last programming
> happened. So the interesting part is at the end of the output. The
> default buffer size per CPU is 1408k, which holds about 150k entries, so
> we can just shorten the buffers to make this less painful.
>
> Can you add 'trace_buf_size=50k' to the kernel command line, which
> limits the buffer size to about 640 entries. Assuming 115200 Baud this
> should then take about 4 seconds per CPU to dump, which still is a bunch
> on a large machine, but definitely way more workable than the default.

Done.  The complete trace file "s7-2-05122026-dump.tar.gz" can be 
obtained from my GitHub repo:

https://github.com/unixpro1970/Sparc64-Kernel-Debugging-Dumps

> IIRC, SPARC64 S7‑2 has 128 threads total, so the resulting uncompressed
> output should be around 7-8M. That's highly compressable text, so the
> resulting dump.xz should be suitable to be stored in github. If github
> does not allow you, let me know and we work something out.
>
> Thanks,
>
>          tglx
>
