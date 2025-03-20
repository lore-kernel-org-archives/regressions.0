Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6FF1BE251
	for <regressions@lists.linux.dev>; Thu, 20 Mar 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742456954; cv=none; b=RUd9JlmJqVupGxxnKl2zk3MiJpJWHFBAGtfYnz34WHxHhAXcKKjzsJQdCd55VN6K+b39SvjjdX4NOv1XpEsOjxmyY05DbvUr2V8wRAFV74LZf14eX0u3UrXH3od9G0ZeFuOFIjyHtwfOyZ/h54pzHhWeGt1rSlt4znzCvQyOC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742456954; c=relaxed/simple;
	bh=yRlwn33uFCo1WzUWKINkmhf7Do4XLLhrmvg41jjhsxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJkviM57xYSQScUIhyD3H3/SO1VGNMOXpYViHzbFpAcAghig8EbtMhD7tsny6yPHqNO/QfmlEvK+zKvEqy/OaAyX2OKcn86ep5KG3PmARRE6PwkMu7LONQAZ9aD1FRGfo6/KTVKmBJzzQ7VUKOG5e1OkGo1jlxl/nEGzlgCu6gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVcInndd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVcInndd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so2658665e9.1
        for <regressions@lists.linux.dev>; Thu, 20 Mar 2025 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742456951; x=1743061751; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ws2Zy20FmJpDTTN7PoL/aNyEtehNiavqFzYGdZ5kc1k=;
        b=HVcInnddIAuXjQOhHvFj+L5U0GV7bBdzxPYchPunFawIBTATqXYMAb6HsOF0FGh9Qb
         5uEy6fl//WVV2Bh7Tq+r9BIZ67eDvXz7NUIUmor3BaFF1JL+iZTQkald+zeial5Usq6q
         xjx8rWj/HmWX3wiPGMvU0+Vuu4pi5asRCsZDyGyLohZ6Uc5E8O9NC998EporpUlJR/KL
         TL/7+0jdhmjUF/ViiEj7rdMfw3EfqZNw0LNfMQe2dWFZghdtnCJiaTTtO/ye4Lpp/9Ea
         IZLWWv6S/ZFj1iMdyjAqZeyPAnAhkoY2wxoaUCA7HGlt1OaNgDVtcT7tdY504PzxisTc
         ZirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456951; x=1743061751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ws2Zy20FmJpDTTN7PoL/aNyEtehNiavqFzYGdZ5kc1k=;
        b=We6UHxb5h0S05Q01IS/rDrl8cGSOmk8o6pA/dC6TgSeIX3Ixi5kUNLgreQNf0bUpwk
         NrtgyvOg5q3kZwc8ORaG2VJdCZfC9+6v3rQBrPcLaDWfsPJpyxoUzDB5taLKBA6UE44U
         ffQrzRCFOjFVPzrt67rbz+vHfK4jAnKt2Oe8arzIjeI/4gp7LgMThVejUXyI/iAb8JUF
         nb1L8Vnnm4y/ksbNxChaBMzEMnL/9eb8HYR4MOJ34PzpqvTPJaeZmyTpDUVJSbreyeSb
         kn1xgOwl70vzSl2zXcxcjNLWYbXVsRwvXas1SxefA5FqIouUIFAE37ouhAgpb2+5o2n4
         hy/A==
X-Forwarded-Encrypted: i=1; AJvYcCXlK8Z1QG3kNU1ZDivpGsRV5g4IIo9vx282Euc8FsEiSULutkmZyLx1Q6fv2dwvpB7zTZGR7UQveOuVcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr0w2G5M36qm21KGl3G5mgB6JUuZ/QaF2rDTcQO061T2TtJZEu
	mfbRu646MRP//YvFboNM7uh550a6vhbPFcDZBkKHo52Tms5JNivO
X-Gm-Gg: ASbGncvyXSddJXJZaBKUr+hHa7l6GWNPVb9p/fDsAnSa82GrJJCwvqKR5Wb6nHfq9+Y
	kRIxLk86kQ71z2UKwaaKyWRzUE8QegHoK/0ZKgl3RHiW95FSnjSAMoHL/F3YTEqimJOzMFmx8HR
	68ssKjDqfzEwSJGkYgortfvD8cURUJpND1oKZlYmWUthCnw+fy3U8gFRQziFfJUXztd+G4G+E62
	DUzBhz7Qm1HEs7iH8bN4dHluczGKSqC2gFwE78F1rNPQTTyeM98iTinVJOSl7NFH/YdVRgK07dj
	5uG3ftGLjrfro5mnbdiPMHtG4BaQXPbV++BUWimhLN0ZcRuhzN89Qsr5OlFbiHwP0wxhuCgm18Q
	/SsORzUQVg4YEN+DAMyDuDQEgOFA=
X-Google-Smtp-Source: AGHT+IH+6TOIh3yGIwGiDxScLZLDrt5LEp15vryvXSV/7bzPMR+dyIfoLNFXNIg4iF0tI4JWMv+IJA==
X-Received: by 2002:a05:600c:5248:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d495893d4mr15878585e9.23.1742456950735;
        Thu, 20 Mar 2025 00:49:10 -0700 (PDT)
Received: from [192.168.10.194] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f6befesm39885735e9.25.2025.03.20.00.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:49:10 -0700 (PDT)
Message-ID: <5e260035-1f1b-4444-b3b8-1b5757e5ed08@gmail.com>
Date: Thu, 20 Mar 2025 08:49:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
 <2025031923-rocklike-unbitten-9e90@gregkh>
Content-Language: en-US, it-IT
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <2025031923-rocklike-unbitten-9e90@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Might be able to test on the distro built kernels that basically trace 
the releases and stable point releases. This should start helping 
bracketing the problem a bit better as a starter. But it is going to 
take a lot of time, since the issue happens when the machine fails to 
get out of hibernation, that is not always, and obvioulsy I need to try 
avoiding this situation as much as possible.

Incidentally, the machine seems to hibernate-resume just fine. It is 
when I suspend-then-hibernate that I get the failures.

Before contacting the network driver authors, I just wanted to query 
whether the issue is likely in it or in the power-management or pcie 
subsystems.

Thanks,
Sergio

On 20/03/2025 00:54, Greg KH wrote:
> On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
>> There is a nasty regression wrt mt7921e in the last LTS series (6.12). If
>> your computer crashes or fails to get out of hibernation, then at the next
>> boot the mt7921e wifi does not work, with dmesg reporting that it is unable
>> to change power state from d3cold to d0.
>>
>> The issue is nasty, because rebooting won't help.
> 
> Can you do a 'git bisect' to track down the issue?  Also, maybe letting
> the network driver authors know about this would be good.
> 
> thanks,
> 
> greg k-h

