Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799971B4C42
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723670670; cv=none; b=G8Hj1PZsag0kPg4IV2DsXxvavsqnw6VP0kPT88HmRrql4demtF0kyHwG0UmqxyAxeqbiEfu+C7BuuUo4uycTEI5I3Ucs7mn59wpFKjA5Wr1FHAHtoDxXxGlMTTmAzdokw6Sj7T18ZxK7lq1wgVIxaqVqtL72bBK2WKAOCbfVGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723670670; c=relaxed/simple;
	bh=70ZVhRIeQZZoEcfgxUeSKJYGOEmRh5NTAji1BZ8/rMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkrOynn6bnskbozUf+p9IXd9yrRhgkqTRBHt1BOjFJCZp+DdkaURDhaennUZgGdQv9BXOU/P5xG1NQv3b/0c2ypYChCxTmGu0Q/OHHfez9bxMko/jrJHpShyaKh+6ABLIA0Iv4F9acM7mn7hqJX5XcKKkYUqASGk0v9w0Menmok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFRRusYT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFRRusYT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-368313809a4so768500f8f.0
        for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723670667; x=1724275467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJ8c8qOAB5Bc3n9KNWTAAiBx1ZDIQSVvg8ywZE8CxyA=;
        b=jFRRusYTP04ALkAtuP3kdicLDDCUYcqaGtIsvJWY7Gtdqb9t72OUz42Hy9vLLuOyKm
         GynvidgoDgpN9lTyci3oweh8xRz2lVzZmMYbz1ly7a+Rt4j+azzLeu2/NVeVWq8Z5Laq
         1dBn6oJ+j1qtc6IobfmkaNQ9MjgflGGCCpnQdVEW0XfxwpQwTBK+ROW/idTRg0liK7BJ
         gRY/hyX8KakKJN9a+Y7KFKWDGaYAnRdyghRWPS5BanJ4iMn8wKLLxSFYNjvwmyPqnhQt
         ecmF2vA6lylK7L5uUEeHiiXmz4e2dxJTUx/Ra6L7VWoFzDnO3y4YsVFIPnuOPtf8BcQR
         6rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723670667; x=1724275467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ8c8qOAB5Bc3n9KNWTAAiBx1ZDIQSVvg8ywZE8CxyA=;
        b=gpcBXe4OSJVU9Xq/XDo46uiSsCZhoaWRg91RCben/9PNavU1uSipx0RujOaDyNReam
         PgiWWLqk+rIN9ACHF3z51nw2VcU8dMXy/Q+j6yMe9tgrTHk2Fh4UhdMcsEonsHn+uymd
         vV1FCooLxG9Jzxm2H4zvNmFMFR6ZW3I9M5yOQYPiJCs7WyOQdMAZyYk28wH9MQHzc4w0
         3moz28nEClv/mdIYRBG9E6GQrvq3EQvbZbbt7UM8yK+hyPB6CxHGUvc2aVX0ACz1CriA
         vDuGnemh2aH98ApWMxAGNg6Y+OTT6yYr6ejI3ZYnYMXuxLE0Wp3OHPsZrYjN+UJx0LbT
         W++A==
X-Forwarded-Encrypted: i=1; AJvYcCXcBzYF1ZUnXz14DMhotMWThyQQDeMTeYxOazs1+TVAMQpC4ClQ3lToGpD9DI5cUQ++AlpZUhnqM/t1c8N0lFYwmjkTl1zmzpzwyRw=
X-Gm-Message-State: AOJu0YzeXw6zNNqR4A2uH0e+Mep06G892YuZKJ1C1xXlKQLKMM5v4H9N
	5XLk5BzycEf5zJyxtwqEvm7ZYG+5z3duhbut0O1Fp6hF60UU+0/T
X-Google-Smtp-Source: AGHT+IE0tdjKd7Izw/570py8NiZmTH5iwdogIHFsUVNtPvq7imLC1cuCKjotWItEmXe2EeaQooQnTg==
X-Received: by 2002:adf:fd8e:0:b0:371:8319:98de with SMTP id ffacd0b85a97d-37186c121e2mr541370f8f.14.1723670666380;
        Wed, 14 Aug 2024 14:24:26 -0700 (PDT)
Received: from ?IPV6:2003:cf:3f1a:a602:9067:1658:40a2:feec? (p200300cf3f1aa6029067165840a2feec.dip0.t-ipconnect.de. [2003:cf:3f1a:a602:9067:1658:40a2:feec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ab469sm45884f8f.100.2024.08.14.14.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 14:24:26 -0700 (PDT)
Message-ID: <c30fd6b3-ca7a-4759-8a53-d42878bf84f7@gmail.com>
Date: Wed, 14 Aug 2024 23:24:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough
 memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: andrea.gelmini@gmail.com, dsterba@suse.com, josef@toxicpanda.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 mikhail.v.gavrilov@gmail.com, regressions@lists.linux.dev
References: <CAL3q7H5zfQNS1qy=jAAZa-7w088Q1K-R7+asj-f++6=N8skWzg@mail.gmail.com>
 <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com>
 <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>
In-Reply-To: <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/24 17:33, Filipe Manana wrote:
> There's a fix there in the bugzilla, and I've just sent it to the mailing list.
> In case you want to try it:
> 
> https://lore.kernel.org/linux-btrfs/d85d72b968a1f7b8538c581eeb8f5baa973dfc95.1723377230.git.fdmanana@suse.com/
> 
> Thanks

Hi Filipe,

this patch mostly fixes the issue, but I still get a 1-2 second window 
of freezing every now and then. I also still see long periods of 100% 
kswapd0 usage, but without the periodic freezing.

Thanks
Jannik
