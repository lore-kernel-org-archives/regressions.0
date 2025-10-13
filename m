Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F82D0C8F
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350732; cv=none; b=BLC+RVGoul85EGJCoJ6XIKlA6kFcoIBMkjJZToqHiLoin1md3UNkdf5KxpO2TEpqnzy4GXZPZ+7pdjf8V0KPmQvCZ2QrN0n0OW9G+PWQGIrNYFfTQepgSFdC3sDY9ZMV5sFfpqlQNewDCkTPNbU4N7/hf/6gwRAjzJLLm2RlZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350732; c=relaxed/simple;
	bh=ADF8yGzPDnUV9V9CEYhBTOLRaV5nRIZMoEbMd85nwVw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fHh6Ao2scphNXA5CM7fCO+1ghiu5HdlhTTvmVfdZaYFFUfRqsfgrWAlW0PMK0MCyQObaOuBoLOb0JhGZmCmvXykmXGh7iaCcQfBR7ndjmpFOAEcziYwzY1l1EOg2q71GsJW+0NRAt9YWPVIJJ22tR75K9NTf5fh5/qDtloJVreQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O05EoaX5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O05EoaX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760350729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8zLr9HRWBU4vFy2Jm9nw9zsWcFfSLePV2+VE2LgCs2c=;
	b=O05EoaX5IKInejqK+tIRbG6C3eIGXqowBmbd6/Qbp7M7eLSMVByJekLCt78W3q2dA27Weh
	KThnXujXlM2UUT/vLb0Untecf7LocKw6mhavkxy1kepMk/pAS/3lnpYDggWpDH0Uuvt+B1
	dE4lSHjIzQKcMzZu5KGSCTPpumXK4wI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3--pM_4lO3PemLg0a2WRCPCQ-1; Mon, 13 Oct 2025 06:18:48 -0400
X-MC-Unique: -pM_4lO3PemLg0a2WRCPCQ-1
X-Mimecast-MFC-AGG-ID: -pM_4lO3PemLg0a2WRCPCQ_1760350727
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e4fa584e7so24102465e9.0
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350727; x=1760955527;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zLr9HRWBU4vFy2Jm9nw9zsWcFfSLePV2+VE2LgCs2c=;
        b=HwrsvMvFhMbnpDBp1v1DRsh7IRjWtwbbDMWpbdT0JcB5y944QGRiCTL5dMFlstPFQI
         QDwXHS4dsdE7JDn1Z5dvjHpFofG0gux2W/ORBsAjGPEFKKNsXmi5Glb/C8/uzjno7/BO
         iIbOjn6yq8a0iZ9kgwFAZE12y0vm6dPVw+Jo8yLL/AfX3yx90ELN4BVSFS38MgKvL7YW
         taVAQ8ovkbaa7EXqXrakkOT05qGrQYFcQyNMUJVK6qnpncZSHa71mu26eQKcV5hcO4C/
         FgB8enlJ3GRQnC3qZu5L3/hUPPXKyl+2rFa1VFecI2D6xxdZonKFmRV1lcbAvkbSbC6l
         K/dw==
X-Forwarded-Encrypted: i=1; AJvYcCVO3NtTD4qYqu/zKy1mQxZaTZkzIce4anS0QIAzxuBWnFE0ch1e6kYpc2gU6qrWrCABKYTzUSsXU5A0BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIDfg/AIDsxAM0TNk0NRCANXx1zaQekZfb9j7P50gFLVo8FOfz
	6KMiV++GvpZI3sFD7XXclo9oyzo20wfztsexWMX/wRB//J0Q9Dpu+ADdEHxgyA0/WNZviE6GNtV
	9YfsLckOpzdL56GttehW6oKHGSOHrHtTUX5GCS6KFC+OmaGQWfUjosY8jcDp1ZaUb
X-Gm-Gg: ASbGncvWDdYuQFeyd0i5UTdzERx5WdDVCNdY4UfrXHoEZ8IB7fbvtQY9uRvOa+3zsc/
	TcY8usqTHTyyMhOscNf5HbJo3tbaZ10oeZM76EDnA3LhDn8xP9hjzHZvQPKkb75pA4nU3H/q9WY
	VpSLhpXJXHLuILWv7DlnCsrVKybin78eg2ObVM26KY8cUDpWnjhG7CKZY/QkAif270kM6VQ7YQS
	YBrYTj9M6OZgkbWcJa0cI+q3nEZYlxNa87EXL4aXpXuJ8cckSDJqqXZ6fRoNNfr3xnUxQvuC49/
	sHhLSWQ1gaxIDoaYSGOr55/NGIXjNr/FShrLuxm0BRX0hLekyw0xzdnVWuDnmLlfW63C4Lj+xnI
	SbSc=
X-Received: by 2002:a05:6000:2485:b0:3ea:63d:44ca with SMTP id ffacd0b85a97d-4266e7d458bmr12984594f8f.32.1760350727193;
        Mon, 13 Oct 2025 03:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM/T8CkEhXD5AffHwvYXnzkgYfTcIzt0LzKyvioPOCxT53MwhT1l9CdJPTaNnAknU5ZLI2Iw==
X-Received: by 2002:a05:6000:2485:b0:3ea:63d:44ca with SMTP id ffacd0b85a97d-4266e7d458bmr12984579f8f.32.1760350726810;
        Mon, 13 Oct 2025 03:18:46 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3b9sm17741952f8f.11.2025.10.13.03.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 03:18:46 -0700 (PDT)
Message-ID: <423de7a3-1c62-4e72-8e79-19a6413e420c@redhat.com>
Date: Mon, 13 Oct 2025 12:18:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regerssion] [KSM] KSM CPU overhead in 6.16+ kernel compared to
 <=6.15 versions ("folio_walk_start" kernel object overhead)
From: David Hildenbrand <david@redhat.com>
To: craftfever@murena.io, akpm@linux-foundation.org, xu.xin16@zte.com.cn,
 chengming.zhou@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <020cf8de6e773bb78ba7614ef250129f11a63781@murena.io>
 <8e458538-69dc-4c0f-a25b-0c85ce1e866e@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <8e458538-69dc-4c0f-a25b-0c85ce1e866e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rbeuAtz0aMuZWvNZoGO-bizGBO5J_KQnY-tra66kuiw_1760350727
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.25 11:52, David Hildenbrand wrote:
> On 13.10.25 11:22, craftfever@murena.io wrote:
> 
> Hi,
> 
>> I've posted about that problem already on bigzilla (#220599), but maintainers asked to post issues on maillist.
>> The problem with freezes during KSM page scanning with certain processes like Chromium with huge virtual memory size amount was fized in 6.17.1 compared to 6.16.x/6.17, but problem with huge CPU overhead is present there. Compared to Linux <=6.15, where the overhead is much lighter anad there no much CPU consuming during KSM scanning, there is "folio_walk_start" kernel object is present (which I reviewed with "perf top" command) that is not present in versions <=6.15 during KSM work and which is in work starting from Linux 6.16. This method very resource-consuming compared to algorithm used in <=6.15 versions. Is there a kernel parameter to disable it or it needs more optimization?
> 
> I doubt hat it has a lot to do with folio_walk_start(), that's just a
> simple page table walk replacing the previous walk based on follow_page().
> 
> So that's why you would suddenly spot it in perf top -- before commit
> b1d3e9bbccb4 ("mm/ksm: convert scan_get_next_rmap_item() from
> follow_page() to folio_walk") we would have used follow_page().
> 
> Do you see any kernel splats / soft-lockups?
> 
> I can see that in commit b1d3e9bbccb4 I removed a cond_resched(). maybe
> that's why it's a problem in you kernel config.

Looking again, no, that's not the case. We do a cond_resched() after 
every page we looked up.

Also, b1d3e9bbccb4 was introduced in v6.12 already. Regarding 
folio_walk_start(), also nothing major changed ever since v6.12.

Looking at scan_get_next_rmap_item(). I guess we might hold the mmap 
lock for quite a long time (if we're iterating large areas where there 
are no suitable pages mapped -- very large sparse areas).

That would explain why we end up calling folio_walk_start() that frequently.

But nothing really changed in that regard lately in KSM code.

What we probably should be doing, is give up the mmap lock after 
scanning a certain size. Or better, switch to per-VMA locks if possible.

Also, looking up each address is highly inefficient if we end up having
large empty areas. A range-walk function would be much better suited for 
that, so we can just jump over holes completely.

But anyhow, nothing seems to have changed ever since 6.15 AFAIKT, so I'm 
not really sure what's going on here. Likely it's unrelated to KSM changes.

-- 
Cheers

David / dhildenb

