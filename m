Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC141A3154
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349165; cv=none; b=ocRDyPWDoBEkKs9v2LYdL/mHfNo1M2kxzbIukbK3VN1Wj12fAAHoRhqUvJmqW9o8SKwqndUxdJcU6aOQvjDgjxKUnn9jUHj1t8agQbs3jCTbRzgRZcgcbliRL7AliMAvdCHm/xyO9Dig9agb53XE7nKIbp/7U6MydVR+uH1kdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349165; c=relaxed/simple;
	bh=i4RWCnW+1JqdQ9hHZbX40k3wR7pXmpsZspps1m5jZ/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODCv8Va3E0OmMwNk+Je0hJG/vC+rzmia3vStU+TS3dZofKhJzoaUEYy3TPoiQVR6LBF2vThtPTDJzWehTV43ZBBFA7yzru1czoLEdrxF3638brs9Jq8xSx1IEB/3+HjkWeyUsJ1fDg1cH4+5cBes/EPZywjXRR7Y84G1+ZPZNb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9Tetipf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9Tetipf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760349162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oi2Sfmi23s/YBlvwVz9Zb9lC5VzSuAra6/nQkk0ykMs=;
	b=V9TetipfCVyiSb0KC1prLpcdj9x0kmcuOhFvF8FrFooJ89xjgO26ARZ2JCva97Hj01wmUy
	sc8HZYuOQafebvlXUpkBMuHSrSjwC3rXkWZumjd9FEk5Zb8iMOP8klRaGax2TXponqvSDW
	UzSfbvFdMj5peSnxGbyai7Fo5Iiaev8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-Tj_3kSmUPgKy5XObR5bx8A-1; Mon, 13 Oct 2025 05:52:41 -0400
X-MC-Unique: Tj_3kSmUPgKy5XObR5bx8A-1
X-Mimecast-MFC-AGG-ID: Tj_3kSmUPgKy5XObR5bx8A_1760349160
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e377d8c80so14188755e9.3
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 02:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349160; x=1760953960;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oi2Sfmi23s/YBlvwVz9Zb9lC5VzSuAra6/nQkk0ykMs=;
        b=w3pjcyXW23pHX6VSoyIyz9r72F/H9VCIw8pVGQBglzU3gsTjNWmsnMUU138XLUPDa1
         YKqsoev+K1+D7LAS+WHrtrt8RRgYBSn2/MI0DvcyKNwqqBuxtfuOzl8cfA0Nd3bY7FXW
         fdoWwnr3cp46UOHZ5VMaOr+7UtthKiSKJ9P3chdjbJeYyd54strSeLzXbrSZaFFKoX5e
         1cvKDeuAgNOpAFOSeC9rhXl6c47mKESAxphm05dZJM20swAlMBaCaernIZ0PB56nDq+n
         ymuz6RTeROKLoZ+wZ1qxDsuPL+CzOZJrIpJg8wp6qB1T77DU/Xk1a5XyzyZ9HkEx9/4i
         eFtw==
X-Forwarded-Encrypted: i=1; AJvYcCUAUupL19J5Lb44l8/ri0xLF4nAaElNhf66X23Rj58ySj9lzY85ffmjcbsoKHb2sq8iL8li9WjAgpeZUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEkr9dTCGjXJM8YAl8ymJ10up+kg+6I7wi5Q/dzgz79Nf5DDII
	oKRvXoXEoj5GKR5WhVIGhvAGDaxg7nBfNpDF+CCNzpc8qd6ntGsCOZOdIwvYdLXBX9V+iUAYyxf
	aKLn5USrKH5pUlRatklrRfxGwHP1c68siQh83TbdD8slglMPqsoD5rYHDMUFXVKqe
X-Gm-Gg: ASbGncsnrm87jnyTSpgrQSzAuzgGTDOMVTFso7EsXlWaO4fs9zHPzy3+BNXWwzKf16A
	hKgWJUnnmDJs6vRw6t2Lwk7ZUxw7TedTVesV77tnnKhq9lTQVfjymKuc8/tJ7P4kcfjx04+uKx6
	cXk3Yw8usWpa3SsQaOStdKqJr86TLe3tsmUsvDQ8GVmESF6U+4N+0/Glef3w++r/16GToTJj12F
	YBZOOW+uSdTWI5PCr//EEzxG3jVJshP0D/n/e5TbhHJCDVotY63bW6y186Zcfgq7NYk+dsxxUK7
	2nxDdAl0b3DfBkRVWcqkEdHiHC7f4RFxbvf6mahVv9GKmZdX7Yi5AWWb1JAA9VKwEs5bCLKi32O
	2ioo=
X-Received: by 2002:a05:600c:3f0c:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-46fa9a86314mr139354525e9.6.1760349160060;
        Mon, 13 Oct 2025 02:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJJvTJXXAUYSufRJ6bGBwkvZMnE+XlLk3jeO6iflZplpU6Frmuj3270Nw6mNxOlIuKspxZ0g==
X-Received: by 2002:a05:600c:3f0c:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-46fa9a86314mr139354395e9.6.1760349159668;
        Mon, 13 Oct 2025 02:52:39 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab656554sm123876145e9.11.2025.10.13.02.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:52:39 -0700 (PDT)
Message-ID: <8e458538-69dc-4c0f-a25b-0c85ce1e866e@redhat.com>
Date: Mon, 13 Oct 2025 11:52:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regerssion] [KSM] KSM CPU overhead in 6.16+ kernel compared to
 <=6.15 versions ("folio_walk_start" kernel object overhead)
To: craftfever@murena.io, akpm@linux-foundation.org, xu.xin16@zte.com.cn,
 chengming.zhou@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <020cf8de6e773bb78ba7614ef250129f11a63781@murena.io>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <020cf8de6e773bb78ba7614ef250129f11a63781@murena.io>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0IG1pQt_I7RmgPvyg4N3ZDJFIw_iPXdscdOUac7UF8_1760349160
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.25 11:22, craftfever@murena.io wrote:

Hi,

> I've posted about that problem already on bigzilla (#220599), but maintainers asked to post issues on maillist.
> The problem with freezes during KSM page scanning with certain processes like Chromium with huge virtual memory size amount was fized in 6.17.1 compared to 6.16.x/6.17, but problem with huge CPU overhead is present there. Compared to Linux <=6.15, where the overhead is much lighter anad there no much CPU consuming during KSM scanning, there is "folio_walk_start" kernel object is present (which I reviewed with "perf top" command) that is not present in versions <=6.15 during KSM work and which is in work starting from Linux 6.16. This method very resource-consuming compared to algorithm used in <=6.15 versions. Is there a kernel parameter to disable it or it needs more optimization?

I doubt hat it has a lot to do with folio_walk_start(), that's just a 
simple page table walk replacing the previous walk based on follow_page().

So that's why you would suddenly spot it in perf top -- before commit 
b1d3e9bbccb4 ("mm/ksm: convert scan_get_next_rmap_item() from 
follow_page() to folio_walk") we would have used follow_page().

Do you see any kernel splats / soft-lockups?

I can see that in commit b1d3e9bbccb4 I removed a cond_resched(). maybe 
that's why it's a problem in you kernel config.

-- 
Cheers

David / dhildenb

