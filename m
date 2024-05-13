Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07CC147C7F
	for <regressions@lists.linux.dev>; Mon, 13 May 2024 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715589558; cv=none; b=tuY+LPrsvnxF4aYS+NVMvRfdF8zYqhEaYgdBKWiabZWFQXSeFjiinxOBUImtPmBiEE8TF95Hh2SHbzYbLXCTbK58ulXUVR61NmRrhanzw1yTaRT+CKJNngfIKujILwxwL4/WzYyNfRj1dE4UDPit/qoDdRGb64Paj3giv9R2nRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715589558; c=relaxed/simple;
	bh=5eXSshADMMz2HS4+hYQumTpVGsj8NwwTPlGcAqN449Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R8ZcWkI7zOE43n/PJemp4ZnV3wkWg2qeq+5wZsNgfk7WxBfzaL5xdXfGmMwMlkoyWWvdNvEthn0BKexRCCK8uV4HTfBlHx8tO5TzMH8iJpCz1KD/HuJaOrQDHpWbgsHHym+JAix2UOIBvyl2kbPX8vr1gFYH+lZB3PgWCaGhK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctzgYe8g; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctzgYe8g"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c99e6b8b1fso1138430b6e.1
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715589556; x=1716194356; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByH4IXOe7meQgCOsgj+8mcZz2ctYq1wZFMn2SyMyJGU=;
        b=ctzgYe8gg9dyqTiSG1ccUHH/m8vyKklD9vHWLFJ2p0LiZrvpRNERcoTWBJVsDzZeuJ
         n4dS3l/KeUITdutXl0zlYsJSsEgMB0fS6unhXtpAJEsWwV6vRM/2nXz7l0x9qz6gjhra
         o8I6/NDfk+1W+MfzpmIP9WbnUR2Edmkrj+s0dhnpe/L8kUSrgUsoVCmXgUMUIJ/6zBwM
         9TGU5tPMZeAEf1Uhc31Fi0Qizr0eyEOY/eP0U55jrBCHAuYRJd5utYMfOc0YmCtM/L1X
         whm9+OeJwT0WVolEtNjZ7WDWYzceIAvmbD52Q5bwUwFN3MXjK386tXPO9a4vCDv8TpGQ
         DOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715589556; x=1716194356;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByH4IXOe7meQgCOsgj+8mcZz2ctYq1wZFMn2SyMyJGU=;
        b=sXTosphv7scvVFZmvOojLwGRz/HIOhbSSVh/ocCSYNgg8pHKMq7HDFdR0sKhJ/i+U9
         RYD8gsoebUYzNAS5SDFRyBrwCv48hnChVLFPCZGK3ZbAhvcoZQVxX0O8V2divGujsbp7
         xkQiYQg/pVez7QDOAC76Bcao37UInYPTeb/8JMTzvgmcgrAzIJtaT48ro9M/7ZMozRKT
         L+SqiQ6GbRp8Q2g4Zj/Zyep+EiC1uw0tZNMxB/4tejMcW8En9lXe/9LU7WRMcjsiViUr
         oY7osavlJkCDpoWn60lFw+KXXqybi30kDwJPnp+RugcKymHbhvYGyefP42FltdhQ0zAu
         Ds+g==
X-Forwarded-Encrypted: i=1; AJvYcCUirEqRdUkYf1pxX4zj3EKENQwZMzVSEy0IlZPZi8HTpzaV943iqYh7MYojS5M37+WEdxfSm2vqlDbmif2WfKw/gmqP9CQU701ydTw=
X-Gm-Message-State: AOJu0YxkVnEhKSLX3/SU/Js9TqpmWBLSdrskY7Wdb0J6lakz7ULWJr92
	EYoGwALyafd1xL3Hn48IDAto7NcD6RTb7+mPTs590DmHqjF+rSnf
X-Google-Smtp-Source: AGHT+IH6PuFjkJnoKBx1FZT+HCTTmOyft0mWTEdDCJWk2yAMPypNDdyTUqOIUPS6yaqMBz/n9DpUFg==
X-Received: by 2002:a54:4597:0:b0:3c8:665e:1e57 with SMTP id 5614622812f47-3c99706d302mr11862624b6e.25.1715589555774;
        Mon, 13 May 2024 01:39:15 -0700 (PDT)
Received: from [192.168.0.107] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ae0da1sm6899069b3a.107.2024.05.13.01.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 01:39:15 -0700 (PDT)
Message-ID: <4e55a37b-f225-482e-ab68-4ab4e839da4d@gmail.com>
Date: Mon, 13 May 2024 15:39:10 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pi
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>, intel-wired-lan@lists.osuosl.org
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 lukas.probsthain@googlemail.com
References: <ZkHPRBLlHJpRytIB@archie.me>
Content-Language: en-US
In-Reply-To: <ZkHPRBLlHJpRytIB@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/13/24 15:28, Bagas Sanjaya wrote:
> Hi,
> 

Please ignore this thread (subject messed up). I will resend with
proper subject instead.

Sorry for inconvenience.

-- 
An old man doll... just what I always wanted! - Clara

