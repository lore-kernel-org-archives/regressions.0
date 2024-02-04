Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A09B65E
	for <regressions@lists.linux.dev>; Sun,  4 Feb 2024 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031459; cv=none; b=Nngx35sEzq7ZVWwuHJPvjLjGW57eJ2rgpw59y8W/+sC7Gca9MyJKmdPL6VoqwRmYT2/GZji4XuhpURVUDazeuJ2wgEx+XvDWE/gldZaLcCfgIMz7nC/+SoSbXR4qU0sV7Yh9Iyx13nn7ZcoveAMdizgG1ODz3Q/cBr6DqIcNkcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031459; c=relaxed/simple;
	bh=PpXmBZu/ttOrrnuRCVGr3y72VEUBIDGQLIInsAyMWEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R14hsT1uK4c/zbRwFwmLUx/NeecQrmD3nQLGkwvSiM5h/pXD4Qh1WWgWVIfWi1NJfAjK+IxqbW4qCjBozm8K2yo+6Vt86fXpKqcCeHTsZKnwOBKuyrI81i0xtp2+1ioNZ9jP0Kevrzc5cNWMloaF8MdsyOW78n1kXKTPcH2iRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qsz1/AnY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qsz1/AnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707031456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLETy/iNSKfFzyXqJhNJJwR2MY8g0ACyfE+gPoZ7mPo=;
	b=Qsz1/AnYELawG+ByaiUH4rWvbbce+A8AGl52I/Jh90ZhNZGv/9ynB4+TLMZs+l4ahmkngZ
	Jkvo5cOH8dNv34l0QFvLm2Gg3sTA10Wz3Zh/m0rQdaWoz6wR9OYQ3F89jzmeOsRinti/KS
	Y7GL9CNH8+K3AqMk9LWkesGwSL8yPow=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-UUsy6TvLOAycK1KBHIdvZQ-1; Sun, 04 Feb 2024 02:24:13 -0500
X-MC-Unique: UUsy6TvLOAycK1KBHIdvZQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33b250a4bd7so792490f8f.3
        for <regressions@lists.linux.dev>; Sat, 03 Feb 2024 23:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707031452; x=1707636252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLETy/iNSKfFzyXqJhNJJwR2MY8g0ACyfE+gPoZ7mPo=;
        b=IaBsbPt7So3QycklLEO9Byws6k1++hqd4nVdImQVzT8aiHqx8WIclAAIq4xzaSY6mZ
         avcqmrcEmrH5uA/Jtzt51r3kSCvvwsxGgpQHBvz3439LQqMpFHRgacPLwIcfW+AzMUlo
         qKT3ILGuxh1wLPBBD6BxOuyahKwF0+JnigH/wE+ZYr4iw6MeG/rRCdtw5jiTxA5kNf0H
         LOD5ErmljB/OMlwetE2RA2e+LVrJWY+Yu8Ohmq9gWHA0D5YjXWrxCKtyuTbS5WtlWvrp
         yrbtbtMoX9QNJGxHGo56nPe3rzSbtueGkmH0d2peeSuXbKKgaLQOr8ml2yVgzN84t7QD
         +ULA==
X-Gm-Message-State: AOJu0Yy8YIU2HjpNmzQTTq0RnGOGGSr6mdydM4o1EGwmTvZlz/LkmaBB
	6EVeORTdcWbO+FwXTNTgn9lrVD0pw914Cq4EkDTDamciV2XfSFcOrriixwx3KV2YeBRY7IRhyoh
	WIcEpGGyBPGuisHaTKA/ndUSPhBy0L9q7nSHaRjBY4Jr1UJI8gs28+a+5p1A9
X-Received: by 2002:adf:e985:0:b0:33b:2471:9ff5 with SMTP id h5-20020adfe985000000b0033b24719ff5mr3256115wrm.46.1707031451976;
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMw5edd8lPXARt8A2JFbHjrwLPmBc12RNW0e5ysvLp152+mHyQquq7fCBabJATf0C76BdENA==
X-Received: by 2002:adf:e985:0:b0:33b:2471:9ff5 with SMTP id h5-20020adfe985000000b0033b24719ff5mr3256107wrm.46.1707031451643;
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXYrNuqjyi5br+xZFq0OWe3dCqS9NovmmPjW6l/DKHV/zC0AYf+MMsBbowh7c60uXqe7pA3mWSNfg7qpg/VCOARIebqG8UH5NF+cMb75FCo5B7KV0QmBpr05KpZiF6N8N9Npi8VsUHmftypKEE2phJwkpeqwHU+G4h69RUxHqJ20WCMNIOuG4B8lWgq+fe9DdMDR8AFr6rxqSNxVX9FM2ZFROG66MzZPbw2t4v2Ov+nHQMEVrXaSPK+cXECpZPbq3f0OKK04z7xF35K6uPfECTJ
Received: from [192.168.1.149] ([212.76.254.34])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b0033ae4a3b285sm5440377wrw.36.2024.02.03.23.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
Message-ID: <a6093a70-29bf-458d-b981-bcd95af7b472@redhat.com>
Date: Sun, 4 Feb 2024 08:24:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: + XPS 13 9343
To: Antoine <debian@r2rien.net>
Cc: Dell.Client.Kernel@dell.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 pmenzel@molgen.mpg.de, regressions@lists.linux.dev, 1061521@bugs.debian.org
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
 <f27b491c-2f1c-4e68-804c-24eeaa8d10de@redhat.com>
 <bc166c19-8da3-cd42-b749-e35eaebe7822@r2rien.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bc166c19-8da3-cd42-b749-e35eaebe7822@r2rien.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Antoine,

On 2/3/24 17:16, Antoine wrote:
> On 1/20/24 21:26, Hans de Goede wrote:
>> Can you try adding "i8042.dumbkbd=1" to your kernel commandline?
>>
>> The next question is if the keyboard will still actually
>> work after suspend/resume with "i8042.dumbkbd=1". If it
>> stays in the list, but no longer works
> 
> Hi, thanks a lot for taking into account our hardware,
> just a supplementary feedback:
> 
> In my case (Dell XPS 13 9343/i5-5200U):
> - Dell Inc. XPS 13 9343/0TM99H, BIOS A19 12/24/2018
> - Linux version 6.6.13-1 (2024-01-20)
> 
> commandline with `i8042.dumbkbd=1` fixes the issue,
> with capslock functional but without led
> + as a side note, hibernate doesn't trigger any issue
> 
> (before getting informed of and testing `i8042.dumbkbd=1`)
> I had attached logs before/after suspend against 6.6.11 and 6.6.13 :
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1061521#30
> 
> I remain at your disposal for any further infos/testing

The issue of the kbd on some Dell XPS models no longer
working after a suspend/resume cycle should be fixed by
these 2 patches which are on their way to Linus' tree:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=683cd8259a9b883a51973511f860976db2550a6e
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=9cf6e24c9fbf17e52de9fff07f12be7565ea6d61

Regards,

Hans

