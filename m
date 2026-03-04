Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8C415E5DC
	for <regressions@lists.linux.dev>; Wed,  4 Mar 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632850; cv=none; b=W+gfzNPt5FnoHAl8yF7deT+zfaytPBVi0Lc1QgLNrCtg57Q1F+WqSRFffQ8B+wUPNURE1fqaeS+fNnN4q/YC+A63qNSvKjabed2ql/iGz5gRPAuCHMlcp7CxGDImDAdDvBN+n5WAOE8Egjb/0ADnVBFr9QAVWBCbI9ugxvMV4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632850; c=relaxed/simple;
	bh=xyguKu7z//BY77YKs22nfEGGVpXcuyaqKE5Yw58xiZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgaWq3HCGvRYYzilk55h3s6q9i01+2ZFnGzduCYukI85NsN4Efa4ENgVRY4I8n8AfOXElaZbq6evVjj8TgrMYzQVboopQiL/kFodxkKwx+77ox+LRg0peBmoar3jiLkcNUO2fCl57SAcv8KbOiF+6m9XSG2vzFGeR9q4xgzYFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UumxGuP/; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UumxGuP/"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-408778a8ec4so1206496fac.0
        for <regressions@lists.linux.dev>; Wed, 04 Mar 2026 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772632848; x=1773237648; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H//S5xtNAR1QEi+Xm0qsXdAi1/1nJ7dHJA1UBRTwpc0=;
        b=UumxGuP/wucUl+9ju9kGPIzQCwIdHIYJq2eCp7XEMQsRJiqUpr+jTSOrIZS+nP/aUC
         lJwBQMwg9YVrFgRIIk5zizTrBcdt0Qn7/PXFQEahrfdUEZQhLsHxeAzR/72Oe2kmF+0N
         2m3yPj/uvCoUYWsUCuY6YHCghAZckcxwqt4JOhk2anbHJaup0GGelsBXULuYv7TlD71A
         EVJ79KdE0H81BSckeNlCjUV0Dzsj72ic7/8Ab04i8/MqDvVv6PU80knawwbc53nQAeZz
         BhomnVETajFPOqBTuoF9hB3u+9SCkzl0BJHADKNoF+197ijGYwAHfl0xy5AFFpK+Rb14
         4okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632848; x=1773237648;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H//S5xtNAR1QEi+Xm0qsXdAi1/1nJ7dHJA1UBRTwpc0=;
        b=ED5s+ISloUCl5T8MxSLzr4MP5GdO/YVsoOXmTHvtvW0SnDleEKvpwi85jkZz3BIiCH
         ONmZ8izO2oNMv0+iO0yHxkEJVpN6mXv5XIGG6E2rjMMYFauZ8Tr/SvnG3S5HCNm6Pmqw
         PUdWPIZiliL9qIfh8ySjh08CIWWJNmYQjhznia29i4ZEJeobmwCDwJ6cQc71cNspAuzf
         t9DO8EWtxS2SoH+61n3xQgo5bdVksdTUcDyzvYxBWNniwn031ruuKRRA1mDeTfJMd7w2
         2zvWKIr6HRAhxpozR0eih9MufDw7lm8Dz1O4qrwWowLk9RE4nARui1iU73XYs0A1AkFk
         5lyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnS0XP7iouIo+oj6G6cd1Gff4fy3FEgDP7sjk5JGdx4nkD7Jv20OH7SOOJRDElLGV/SzXIbC2takeB5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKvPcExHRmRdKiEZkR9wesmvIGRb55dO5hxecL57pNOw6eEDhV
	i111k+E6aXZRQyj31O4lVNPQStcbNqNrHKdYJxpN+s5S2S572BSpdBlUiMdeirg3D8A=
X-Gm-Gg: ATEYQzxWMXVszOWK+UhjXvQVhMJ5d1I0ZLknCP/txq9MBSiqJPvoTbm544f76uGCKWP
	o2YlfUfArXKF7sVl57shMSTO6lSND+uwkUC2QMOjnKFb1CaDLDx0UfW+MMoyGKjXzcxLsLV0npK
	WlVset7Fo7krUhb17/nNfGR16lzWE62MbqMyyJsNGbxiVxLVooXydhP2SPnBl9NtfMcSKGu+dQP
	Rlb3bT6Q869ubcmJ7Zx347VR9W/i7zWrj6Rf/w0IkHaLSESL/eAS6g/mSBeGvqVzlWdjMPvdaAk
	hNifxTKWyvliBc9umf6Jv9tfvEJHs07l6AOeciQ2OQDwqEHiVJLvkwabFDsukz37IZNrnVHbXqW
	dNjMEr+A8FBlWUGzqs07/jZCe5uWpvO1SoLBAYil0RJ5ciaHJ8Cj6K3/6P/P8h4V19c+Xi/3bAJ
	PQkpRUWw13YjOZZLd9wXfbotLkU9AjRICInOQRdccSfw5EpCS9c6BonaTH2B4OPrOpMsioeYSb2
	4p0tzW0cXRNyWK7uPYZ
X-Received: by 2002:a05:6870:16f5:b0:3ec:52d4:bd49 with SMTP id 586e51a60fabf-416abb9ade9mr1060083fac.48.1772632847670;
        Wed, 04 Mar 2026 06:00:47 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d277316sm17536922fac.17.2026.03.04.06.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 06:00:47 -0800 (PST)
Message-ID: <ff161a14-85e3-46c8-93ac-091f84e23807@kernel.dk>
Date: Wed, 4 Mar 2026 07:00:46 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reporting a Linux Kernel Vulnerability and Requesting a CVE ID
To: =?UTF-8?B?5YiY5Lyv56a5?= <liuboyu2024@iscas.ac.cn>, security@kernel.org
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <7002e9a4.4e95f.19cb7fe6fb7.Coremail.liuboyu2024@iscas.ac.cn>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <7002e9a4.4e95f.19cb7fe6fb7.Coremail.liuboyu2024@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Does this still reproduce in current -git? 6.12 is quite old. If it
does, send the report to linux-block@vger.kernel.org. You need to be
root to hit any of this, there's no security vulnerability here.

-- 
Jens Axboe
