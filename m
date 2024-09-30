Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A563BB24
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727713526; cv=none; b=ElajBkYKXXv07GXtncoGZCtyb/Vfubu+Gwyy9vkz5a7yH007zs1WL4WBY+IEDrJEefy3kfRmtI3mHwjPt+Pt1g7Lon938/GkelyD8ew8yu+i4JcgKtajT9HLPsWzYdW3dAiu49Gx8wE8AGPSORvSOYyczazT1wg0sPfZYSwLzsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727713526; c=relaxed/simple;
	bh=J4c6ww02lHVyWMgO4yK4OukWjlCltUYn0A0YgEeDjlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEqfLB05cfsu95geBauMq+bXHe0ejJuwpBSg8vSR2fMkD42y8P0YamAe4bGbaqn+I6k0iH2nT0Sb2nlpuYxl423NADCc4eUCQrYQA8xadn0asqJK7yhmx7gImg82/MJFcQHenPMnW2ZrD9g/GLJjNZgJAmtJXtNOMBuB30S8G10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Ve/GFB+g; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Ve/GFB+g"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-82aac438539so234721239f.1
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727713523; x=1728318323; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omPN4w7+Ji+YlU2yam7PKuuBj5W5Hc5vkOTfbiaU3Yk=;
        b=Ve/GFB+gcwdqZKsfu6htLWNMCSUghKes2y9CeBbnuP4LWLQDXw2yFBtsM1stNeVo9G
         IzhpC4+C2n3eVkmhCZmr+aRu61tzloAAVel78qepD7raEfGV/L+oea9AT/JH32divWqb
         K96RzQnlJDRNgahaABQ+gUNG0rgqoPX1v+L17hbLiInUe+7avGotBmEpokrCXmwv/u9C
         oFlpqsQzFKZVZZzT/ttuYJMcqtyi44zl7HnjAKhL+vTbpNROqYGiRz2EVGtFResfKmpP
         LzcubxVzjWOCfsPkGBy4bxcXUIQO0FGOq6jFOlpuLT2+i8AfzpqQJrO7MEaF9/J4QguO
         kTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713523; x=1728318323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omPN4w7+Ji+YlU2yam7PKuuBj5W5Hc5vkOTfbiaU3Yk=;
        b=YrdATm5ASLFhJwzCwPoBx1O0LG3m50IG326tnY3VicH+lXJMdNzOvyW7hlYpjaAkEY
         1Te4NECCtkYAVoEf8AFCmb3qRcLdatqelXyMHoMj/IoCa9/SsiOEU2XcL7IyO2TdtioN
         oepBoj0FJUFxaeKRQMgCRYxad6b8FJA8pkrhLeF3PXdN4QpwzEmAwwwae0YSQ0zKnDsf
         WByHIoUKM/pKiTVH3Bkotjra9qzUfFNkpKWPd5/zZ52zj9pqzb3FiwShBZwYEaiRh3jk
         ZX3FnIsObt6FZbyqjUOaNd3CxHCj9KIEvdZPTV//ki74UyMjRfxP5nLLfo4ySMzthcn3
         pR5w==
X-Forwarded-Encrypted: i=1; AJvYcCV977g/Pnlpc9Kmw5JZ4Ual11BLiEPtv4B7PCuesIAr9NMxdLfApACqN6gpyPJOshJZJNcTcA7bXl8WHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzalKFweFaKNZGf2zt+JOhlfr5XZaS+syjeX68qsM62zKrwWkHd
	3RJAaMbDzio7bMLGBJ1jLG+GnwyFAwDsVGNqZt1eu23C7SaC/8ntm2JZ2u+dkyM=
X-Google-Smtp-Source: AGHT+IEIczCRKzK2BtvKeshh8rAOS3pL0Obj9CvhSs0zGuLWI7GKP/hfxlBfy4agzmnEwV00BQFBFg==
X-Received: by 2002:a05:6e02:1563:b0:3a0:378a:884b with SMTP id e9e14a558f8ab-3a3451458b4mr97854735ab.3.1727713523236;
        Mon, 30 Sep 2024 09:25:23 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344d8207esm25417955ab.35.2024.09.30.09.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 09:25:22 -0700 (PDT)
Message-ID: <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
Date: Mon, 30 Sep 2024 10:25:21 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <91194406-3fdf-4e38-9838-d334af538f74@kernel.dk>
 <20240928061038.GAZved3hMSU3XahWrJ@fat_crate.local>
 <5fe1e264-c285-4988-b1e3-46771d07172b@kernel.dk>
 <20240930044313.GAZvosYZF5mHi2OZbC@fat_crate.local>
 <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
 <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/24 10:16 AM, Borislav Petkov wrote:
> On September 30, 2024 2:27:03 PM GMT+02:00, Jens Axboe <axboe@kernel.dk> wrote:
>> Would it perhaps be an idea to revert the cleanup until then? I can't
>> be the only one hit by this. We obviously missed -rc1 now, but...
> 
> You're the first one I'm hearing about. Either your configuration is
> weird or something else is amiss. I've tested this patch on all AMD
> families. But sure, feel free to send a properly explained revert and
> I'll ack it.

Hmm, seems like a pretty standard cpu and updated microcode fw, no? But
if it's just me, we can just defer until it gets fixed, at least for
some more rcs. I just pruned the microcode for now to work around it, as
it's pretty annoying to forget about doing the reverts and then booting
a broken kernel. The box takes minutes to post+boot.

-- 
Jens Axboe
