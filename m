Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A014900E
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318314; cv=none; b=FTBWRagVnjjhh1dAlgWwfRfnm0qr8YG2iZOQ/YDyIHfEu53jK0BQAakD5iQy/w82XR/AUJCC5rxXILC0p7R9Olgy2HvmA7stFf/aGAA0elSkXXuMRt8wx/ap4sAeY33c52G6OYX6WAzz/7n2tfjouvkJOOf924fotmYLN8i33WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318314; c=relaxed/simple;
	bh=9ig+Kyi/baZpS+645Jg/adbwo2c9nTOBE6Yno5YS9f0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BtB6xBuZ9z1eJM6ZD4w4hubvo+UotvyBDlq7GSKvMnm+Y1IWhtcRa3+uvbkvk3cw70s5Blg+CP1tqK2tSdSyrYDOU5hsVSq1taf3uSuKhsIWL1XYGNhP3xHsinl604gVpZVzc2PUqkmebHIZyQJv3Hf3tjzE+W1plVIR+g4h+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ZPFor8xr; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ZPFor8xr"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36c84c95c23so1595925ab.2
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716318311; x=1716923111; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nRu+e+4ihYIHhqnVRJg1n8yw7RtfPjEVL53AovtGebw=;
        b=ZPFor8xrEvmRoRt8EGiqAxQbRn3ttafKf4yqNGOl8gCozqKz/pfNKJMUfdOj671tJS
         EmTAN4X0RsCY1dD3A4fZSfwZrc3oVHjFbKlDK7IBaGQuLyVkb3e63GkdV0x+1DG24PNd
         Em6VPwqB0hAv4pzfo+ghfMKPPmjYY/ZCofLtn82EIj/caKFS/KgUz6Rse4r1y4Wg1LSq
         reLLs0Fif9ogJjQDykSh+Ec7l8d4pvl+YakRJ3G9BKiQ8renjZMcIwV3qVW1nvtzcmyH
         YU8mgvJVmRYHek85bGeFUqI6JM+U4k389CGprU8bQapKHhXLqqFSlCtChXAzZbTkS4L3
         iHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318311; x=1716923111;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRu+e+4ihYIHhqnVRJg1n8yw7RtfPjEVL53AovtGebw=;
        b=JUqVsIG64MAOZ85P+vi6t8Ahy05Lv2KML+LS2qhI0AVT0WaljXWkfkflY/6MMDPApO
         DzZVeNPhfK9tCdME7niwF2TEWpVs/GQbjWrrfZwvnwGjv/zRmMBaYEwrhzWOfj3F6i84
         GnATHQw/PFg5rWuFa7yMaNYbPoNJv5fNKw6jeGZZ8lJc/4LBX+6XKYlfyNIWVZStM4+m
         Nd+jcWznUaIIz5wW1hn1f9n5ze4DToxCb3T94Ulyh1ROAV9P4HmXs3l2LOL5ymYafYCj
         UIsy5q7eQ+evamNuRSfBM6Do432pRO+nKYGV8b0TXESH7MGvfZl1A1IIzVUtyN/ro8R5
         MEyw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5wmrcNAI1SS0mo1rLz/xfBl57WqCTfrPxxY8u97f79W3WxUw7rsH44p8i4sZrW3EGKRlRAsXLSmR98m+6upop5SqbXiCrPcRpSQ=
X-Gm-Message-State: AOJu0YxTmu03T4ipKGNKrbECO/3xt1vBezaKWJyMkKvT9s1VoEyCCPDA
	zjtf9bqVkzTlSdjpsI66x53otaJGFWd8LdQ+dfWnyTX3fYgb7nciiFDxcheF24k=
X-Google-Smtp-Source: AGHT+IE85FfzZm1BhB04tBLgcH/K0Mtaq5JAegY01Fm5dtbDRyiqHop3XkES1ZT1sB5tYMocE/6/og==
X-Received: by 2002:a92:c988:0:b0:36c:c86b:9181 with SMTP id e9e14a558f8ab-36cc86b9470mr310516235ab.0.1716318311506;
        Tue, 21 May 2024 12:05:11 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36db97b8f1bsm37349525ab.73.2024.05.21.12.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:05:10 -0700 (PDT)
Message-ID: <d4cadead-369d-4d94-ac85-58034d75c6c7@kernel.dk>
Date: Tue, 21 May 2024 13:05:08 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
From: Jens Axboe <axboe@kernel.dk>
To: Christian Heusel <christian@heusel.eu>
Cc: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev,
 io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
 <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
 <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
Content-Language: en-US
In-Reply-To: <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 12:29 PM, Jens Axboe wrote:
> On 5/21/24 12:25 PM, Jens Axboe wrote:
>> Outside of that, only other thing I can think of is that the final
>> close would be punted to task_work by fput(), which means there's also
>> a dependency on the task having run its kernel task_work before it's
>> fully closed.
> 
> Yep I think that's it, the below should fix it.

Sent it out and also wrote a test case to catch this:

https://git.kernel.dk/cgit/liburing/commit/?id=06c22ef6637284ab1f31ee64f1ee48a829958816

just in case we ever regress in that manner again.

This will go into the 6.10-rc1 release, will ship it to Linus in a day or
two. And then it'll land in the next stable release of 6.9 as well.

Thanks for the report!

-- 
Jens Axboe


