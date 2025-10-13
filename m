Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724C2DAFAE
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760385548; cv=none; b=Dj7r9K0zYl2TBkTsB2zpx6FFeRulHftJPojzHIoxWRVGGAGyuE5ydmacJmmZW57GooErUJH/kUiu7Q97jZdfS5DycreJhK8uPo/Z8i7iPmrLf2OxOhXxAGc1fL87RhF7UXdihtfyBLpcjwp8mz5ZEPWZShYEk0kvQQaQNQAwZOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760385548; c=relaxed/simple;
	bh=sezSXOJQy2e1FfQT3DvAibk3dsRjxgWqO6zkN/PeAc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gc4jk0kCOiLRw1HeLcCkqxfkzagyCoDWX6WeOYLLnbK6ZFvo2jnKGilYdOuaDQj37H+tVXBF3JVN/I7b7etyvi3kH79M5A3QCWU6sxONexP26CMYtswQM0607+vbd1j8Kwe0osbNPKhV1SEn0MrTzT/B8gi8mGsZCqS/wrT2zp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2Ogd+vr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2Ogd+vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760385545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cNYrRRv0UVpj7OF83STXMa0S0+9wdXsPDfsjLG00SV8=;
	b=S2Ogd+vrch0AhlRr0xMhOasUyhTFrCel/O2dqWA1fL/HpJJue3SydZztIP9IJS8Q/4W/JN
	pA3OBtp0UpvJtlCJB8PhnuyhYrt1Yz9msPkfm2F38Bonjav8s/bAZvCF0zp4GT0ATFdPRC
	e5Cfw0F/9HaKS2ZZF17Da/GpVTcoT40=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-citW8QokP4iUX8S9ew97MA-1; Mon, 13 Oct 2025 15:59:03 -0400
X-MC-Unique: citW8QokP4iUX8S9ew97MA-1
X-Mimecast-MFC-AGG-ID: citW8QokP4iUX8S9ew97MA_1760385542
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ecdc9dbc5fso3466539f8f.1
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 12:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760385542; x=1760990342;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNYrRRv0UVpj7OF83STXMa0S0+9wdXsPDfsjLG00SV8=;
        b=H40+FKn2eh4PdigB8fsE0KyIpwJK7xsbMuk+QPM/QTm1/0lLEJbhvirkL21qASYUwD
         LdH+my552Uo16HP+H8yzk8Xa7+9uLkfj/ujMgXw7fMObz4Xd3wB1Nga5Kj3F6FfKz6e1
         NYVOxPi8VrYAyfjPlfJvkIjD9coXxcU6nD8OB/dwZgm6DNOtRS4ce4zACUdy7G7tJXJt
         PA13FQX+lA0T035Hr3iYG2hpMOrBxXP8pp/jEadII8OooKzMeQb2v/tKqaQG3TbfhGYg
         hxwPdFT9OO6s7Cq0UJQgOM13y+mxrP1XpNKd/6iE7+Zp3WUwqdZGWFtP0uT0lKfSEr3a
         ecGg==
X-Forwarded-Encrypted: i=1; AJvYcCWXGuPx4Z7HTcvuuAtBT7ERSedWAaPl3rhf3zME5sNLauQ6vjTl4QekJiOk+AkTllmKpO90hkgB0eSszQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWoFnKNgNpmwYuz5xIP+mFjFjzXcSIaH/hxWnXQbneRnGp7KnO
	VdrpE9Aoz04OV7A7jO8uZ0uuYo/gefQ3MOwMRPY2IppibpBlh1RwXse5i1Abo6yCXvH/84x9ggc
	YsIMKvqOqJVqAN8Pn83C7rA9ykmGLbABAkeUe/NU1NwPmfK8UH3suAVilZNKN1vpN
X-Gm-Gg: ASbGncvW/hH9/Mpli4QxALv/WyDFQfqzSJ/dthQhpH0CbfrgOyP9JEQMQk/Zl8QdDGS
	QRzTG6dzCjI7oxGzdtBcCdzfQK0MnGHE8XbFuupF4l3h66pRKB7QgLtZmeo+Gay5Uzy5RsD/pxJ
	7giQogpTl9yXWQOTIT/7RuGrYsaXOq0+CuSzMpX8l1KDKu6Gk5heTzIwuVyBlJtMI/+8zBzKcEz
	UUTXJkXiN3kUFuBfI//kQLva69hS0Ve+T7tfmPj3ctFcMrR14Mp2Rx5cShWNUV8aoDtISuCWRQe
	4YbEGRz1JQsH2X0cCl5jEHvNd/ez5Gt6toJ854uyNc3EEL1k/laIIkGQDksVItUCDhHV5m1R+XS
	8D7g=
X-Received: by 2002:a05:6000:25c3:b0:3ec:e276:f3d5 with SMTP id ffacd0b85a97d-4266e8dabeamr14498754f8f.42.1760385542149;
        Mon, 13 Oct 2025 12:59:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvpCF44kQW5Htm2GFpYxYfXyTl5+0TLHHcYsSHm1UZ8A4aEwGaAWQh2xxcjFLKzYXV6CxPHw==
X-Received: by 2002:a05:6000:25c3:b0:3ec:e276:f3d5 with SMTP id ffacd0b85a97d-4266e8dabeamr14498742f8f.42.1760385541739;
        Mon, 13 Oct 2025 12:59:01 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57ccb1sm19843079f8f.8.2025.10.13.12.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 12:59:01 -0700 (PDT)
Message-ID: <26a8f0aa-8d67-47ba-841c-2daf7010a2aa@redhat.com>
Date: Mon, 13 Oct 2025 21:58:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regerssion] [KSM] KSM CPU overhead in 6.16+ kernel compared to
 <=6.15 versions ("folio_walk_start" kernel object overhead)
To: craftfever@murena.io
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, regressions@lists.linux.dev, xu.xin16@zte.com.cn
References: <80b153cd-8bba-4bcd-9b56-3b2ad3f295e1@redhat.com>
 <46d26246-5bd5-43f7-b1a4-dc721f717413@airmail.cc>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <46d26246-5bd5-43f7-b1a4-dc721f717413@airmail.cc>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jkgAYdM8J8Z_BOwjg0Gi7O4i12EBnyzfq4NoQhBI3bY_1760385542
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.25 21:54, craftfever wrote:
> 
> Unfortunately, yes I can reproduce it. And I thought that lockups does
> not happen anymore, but I was wrong, I booted today with 6.17.2 updated
> and KSM enabled and whole situation is back. But, it only happens, when
> scanning pages corresponding to a process with huge VM size, like
> Chromium with 1TB of virtual memory. The rest is alright. It's look
> like, that the folio_walk_start called with much higher frequency, than
> in 6.12-6.15 versions. in that version page scanning of huge VM size
> processes is pretty fast and flawless) Right now, when Chromium is
> running, I expecting constant 42% folio_walk_start and 15%
> ksm_scan_thread on 6.17.2 kernel (contrary to 1% folio_walk_start and
> even less ksm_scan_thread in 6.12-6.15). I must admin that whole system
> is not freezing, just Chromium with high CPU usage from ksmd and kernel.

What about 6.16?

-- 
Cheers

David / dhildenb

