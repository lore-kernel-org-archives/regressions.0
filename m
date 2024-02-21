Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00081219
	for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530996; cv=none; b=mzTLtrbJPEQvBes2kJ0U1fxyMgdRkWBVVHn3IFriKR9oFgEjMyYvL6M3DqAXXqFe4dLoo47HvC8KYYUAd8rSRIWJRoUA+YNcPmmdXDWkvl4zAqlg3+j/04DREg9RqB6erjUHOVeUgySA3mmy6VxKDTiCthp+dSKgyBk41nN1Uk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530996; c=relaxed/simple;
	bh=ZUX/1cEeS2opt7uWJImaEjdk6D2+iQl3jJk0D4QXh9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXIesWLKze2u4n7M0AwTKlKgC4e57ts8RHTJZ4M1ripFSDYNS/fjVd10CfP+FtmNF8kQxMox/uw7k0GwVYc6ChcCHwrweugsunzJoAKRfF7wFjWu0H7xwFIWDvw7fA7l/C2+eN73M/vHvacQEj4RFjqXr0qJPgzy8xFhiSfR2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UtXMO2Xw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UtXMO2Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708530994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZsHVkLWuDosCYj2WzdkYbopzdEkYud7moBVaGxV+Kw=;
	b=UtXMO2XwXWb1bOTpzGRacHhiAf8IAarVSsPirzLUEcxgA0S5JuA4rZQePn2DYDzZ/VRYjz
	tN9N8Y3GFqY3XCTYZvfzJoJShXlX+Zn4QkVc8wGUgtGvZqfQJ8K7tL8izZbVxARUTFrbQj
	O1KtuOCxSf7ahsKhzDTOn5fZHye54RQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-4sXRmVxhOaWRFq_u7bptAw-1; Wed, 21 Feb 2024 10:56:32 -0500
X-MC-Unique: 4sXRmVxhOaWRFq_u7bptAw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-412793c1cc5so1896525e9.1
        for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 07:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530991; x=1709135791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZsHVkLWuDosCYj2WzdkYbopzdEkYud7moBVaGxV+Kw=;
        b=jbJfde3DF58aIvYJGkcZPDs72cWN4PK2UGua9M3kKzMOB83CORcRMRULvbTQt91n6R
         cu9fHY9gJnU1h10LqgFadURRio8Ho0VbMLdvTNwQz/xaZE4zSuNN73xvZ7x0fTYp9n77
         cpNtcUy60+gmKe9O5ThfRxuZlAlFiPkDVQkRHAdR548tJWRtZahbO1dV+efx7cTvoHVs
         npZT+S0qZVJ3AMMKQ7ANbxJZ1RGdCd0y1w1/gUgpcFJmPHvXwaVwitkQNWttcTLb/BVR
         bIQqCzcRONpLSCqWe8UWLVf0lpbEIvTsAlwzlQAQ2K6011f7mY8cvoJhE9dXhGXcpJ3b
         qEMg==
X-Gm-Message-State: AOJu0YzXgBqejHTe3jb5KmFgsuF8uXPu7LExFEYEOUVPolwD38RGzLie
	LWRuaH1elwrFpM192K4t6BYgDcHV1THRyMUhp5JcUiTKLdeQ3p/tfujVkA52m+HPplLgBlAbfkx
	4Gcd4Vev1ekiGqHOSAFNel43ZL8pppMmqsIQzuMLKjny4gw7Mam9Lz9RKDyz685OLL48UuMaayP
	reMToYA3gL0TYy+8MqSHMvYoRt8LugavCLF/xbty7sIkd+
X-Received: by 2002:adf:e19e:0:b0:33d:1d7a:fc7a with SMTP id az30-20020adfe19e000000b0033d1d7afc7amr14601215wrb.16.1708530991035;
        Wed, 21 Feb 2024 07:56:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd0X+bhtKokXwS/Yl6e8ZZ8BEhwEZn5Kok+xd+K6ptSn+DM9LQ4tXLOleinAVfHngvw4rp2Q==
X-Received: by 2002:adf:e19e:0:b0:33d:1d7a:fc7a with SMTP id az30-20020adfe19e000000b0033d1d7afc7amr14601201wrb.16.1708530990663;
        Wed, 21 Feb 2024 07:56:30 -0800 (PST)
Received: from [192.168.188.25] ([80.243.52.135])
        by smtp.gmail.com with ESMTPSA id j11-20020adff54b000000b0033b43a5f53csm17350401wrp.103.2024.02.21.07.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 07:56:30 -0800 (PST)
Message-ID: <e733c14e-0bdd-41b2-82aa-90c0449aff25@redhat.com>
Date: Wed, 21 Feb 2024 16:56:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.8-rc process is unable to exit and consumes a lot
 of cpu
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Matt Heon <mheon@redhat.com>, Ed Santiago <santiago@redhat.com>
References: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
 <652928aa-0fb8-425e-87b0-d65176dd2cfa@redhat.com>
 <9b92706b-14c2-4761-95fb-7dbbaede57f4@leemhuis.info>
From: Paul Holzinger <pholzing@redhat.com>
In-Reply-To: <9b92706b-14c2-4761-95fb-7dbbaede57f4@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 21/02/2024 15:42, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 21.02.24 15:31, Paul Holzinger wrote:
>> On 21/02/2024 15:20, Paul Holzinger wrote:
>>> we are seeing problems with the 6.8-rc kernels[1] in our CI systems,
>>> we see random process timeouts across our test suite. It appears that
>>> sometimes a process is unable to exit, nothing happens even if we send
>>> SIGKILL and instead the process consumes a lof of cpu.
>> [...]
> Thx for the report.
>
> Warning, this is not my area of expertise, so this might send you in the
> totally wrong direction.
>
> I briefly checked lore for similar reports and noticed this one when I
> searched for shrink_dcache_parent:
>
> https://lore.kernel.org/all/ZcKOGpTXnlmfplGR@gmail.com/
>
> Do you think that might be related? A fix for this is pending in vfs.git.
>
> Ciao, Thorsten
>
yes that does seem very relevant. Running the sysrq command I get the 
same backtrace as the reporter there so I think it is fair to assume 
this is the same bug. Looking forward to get the fix into mainline.

Thanks,
Paul

