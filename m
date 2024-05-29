Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD40F15B97D
	for <regressions@lists.linux.dev>; Wed, 29 May 2024 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995398; cv=none; b=ZU3dMSuVMFRvr+Tjxbu/e50bAFhqyX31/coG/7S0wvfPqAr+PcyfcNiW6Gmq7go8OMUmotyvIvDvgaWzBm18mq9+9WrTXV/rBDfOhxcfQyTQr9kSX48Hrjye3nZW5chvv1fNvOXy0/VISDuKo1ieviukoOvy7RxOuTYftgSjtM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995398; c=relaxed/simple;
	bh=mlvdMnXQm5x1qWpfm4xuhnDcqdkOQN7ibjz/WVpV/KU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E7KCYVAheYs/2vdT2CtjJTjS9xBLsLAw76WA1aO9LC7YX1Oz7GPNxsom+7WaXLlaq53opWslQ9879xrDYLAa2PhYxS0l/DTbMwfwpq0oEEyDXN9N5TSE1xsr/zXyLABXIfR8sGDYZijlzZIpveZhxVLinm4EJ/lz7VL1gxOnI5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KGERC7O0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KGERC7O0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716995395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/xbZFT1XaokgTezQUZXctPQ0AEMSGFvQXtxdfPhl30=;
	b=KGERC7O0fuP2Ds5C782FhtI5sNeHHDOmn91LkEkA7INivhOaAn4trj3xwyBkDE/tFe/OOA
	0GPaLoWnblG/YUxX6z2F2vEfN9krqqUJu62Ouv+h22qPwjSIBPN1OZNHXB3o2J0QYCjKcJ
	6slu1kgvCZkx5EbsWcxCnq1PXY3Id78=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-IDgU0jhcNXCnn3HhBh3lTg-1; Wed, 29 May 2024 11:09:53 -0400
X-MC-Unique: IDgU0jhcNXCnn3HhBh3lTg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1f44b594754so22673965ad.2
        for <regressions@lists.linux.dev>; Wed, 29 May 2024 08:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995393; x=1717600193;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/xbZFT1XaokgTezQUZXctPQ0AEMSGFvQXtxdfPhl30=;
        b=mtkDAgXx2b8A1KEZpAqjNahLGsnlkUWi+X+nI+iQTml1O0erphLMSsqAbXHZ8ZujV/
         ZUOKC/dN5zdMJEFjilW7QmkEjOc4Qzs+W502pEz8MsboQLAIbhv409ru+XtqUaQq9LIf
         amXAMJHYsiApLs0snu5DnZ6fPFfMGtP/E4BznceZpDxXpcGDMgngDM17AwouiV0gM859
         p3MJpBMJNnIp/E7lKnO9u3Fl55lYrtALOFKB0waBHHXrU5wrfgrZl5Y/casjGfYTiyRQ
         slYFIcH5EEGH6mI4xJxscG34y5nrdjoWAYBZYbqCWCUXbwhBHovsvDoJVQEadsPbo2PO
         A6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZolDhG0vituLfsqGIw2M94OR4WBrO2YLVAvoICbUmbf3nZvsM0kZkZjCtpr7fmWSE14W8y0xq97f1qoQKEb1mMP3jeIM8b+2CICA=
X-Gm-Message-State: AOJu0Yw2/2Y8iz3RdvofyYgiGthpqZqAZvE5GZ2/4CFFxSUK3W0kUypy
	VbFLkUZjgjfNjrdziEKZ9ykdnWKi2ZXOlf2I5QxCRVA00sJCU0FiH0h3Cz+KHrSZtCB1hoUHcwW
	Ti93BXofgKyTI+P0bjxSwZEjsgjUYRPvpA4U9ws8/17tf8YYYDijsloB36+Q=
X-Received: by 2002:a17:902:f68e:b0:1f4:b316:57f2 with SMTP id d9443c01a7336-1f4b3165bb5mr84420315ad.40.1716995392764;
        Wed, 29 May 2024 08:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESJIuVqyrSreBzNsGwEIgmcHckygCCtU9UJsKuVwk6bMzlNtWIgx30hhAYQu4JLnVO41POnA==
X-Received: by 2002:a17:902:f68e:b0:1f4:b316:57f2 with SMTP id d9443c01a7336-1f4b3165bb5mr84419975ad.40.1716995392226;
        Wed, 29 May 2024 08:09:52 -0700 (PDT)
Received: from ?IPV6:2001:569:7cd6:cc00:99d0:471c:5800:8739? ([2001:569:7cd6:cc00:99d0:471c:5800:8739])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9683a8sm99923335ad.132.2024.05.29.08.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:09:51 -0700 (PDT)
Message-ID: <8c460997-f8ff-4985-9e8a-09697a647a28@redhat.com>
Date: Wed, 29 May 2024 08:09:50 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Adam Williamson <awilliam@redhat.com>
Subject: Re: Intermittent inability to type in graphical Plymouth on UEFI VMs
 since kernel 6.9
To: Genes Lists <lists@sapience.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org
Cc: jforbes@redhat.com, rstrode@redhat.com
References: <75c17881-68e9-40e7-821c-5655d49d7c0f@redhat.com>
 <8fee69cc8fdd67fd265790c0fa287cb9566c2349.camel@sapience.com>
 <165f7cfd-41bc-4c37-b859-a418a3ccece7@leemhuis.info>
 <c5b3d3ec7701b51dd7b163261c84fb54c778b9bb.camel@sapience.com>
Organization: Red Hat
In-Reply-To: <c5b3d3ec7701b51dd7b163261c84fb54c778b9bb.camel@sapience.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-29 06:35, Genes Lists wrote:
> On Wed, 2024-05-29 at 15:01 +0200, Linux regression tracking (Thorsten
> Leemhuis) wrote:
>>>
>>>      cpu i9-12900K  / Raptor Lake-P [Iris Xe Graphics]
> 
>    Sorry, this should be:  13th Gen Intel(R) Core(TM) i7-1360P
> 
> 
>>>
>>
>> Does this happen every boot or only sometimes? Could you maybe upload
>> the full dmesg from a boot where things worked and one where only the
> 
> For me it is every boot - the first few key strokes are accepted but no
> asterisks are displayed - and it works fine even though fewer asterisks
> are displayed than characters typed.

That sounds different from my case. In openQA (and the one time I saw it 
live), the keystrokes do not appear to have any effect - no dots are 
echoed at all, and hitting enter does not submit the passphrase.

I have no idea where to send emails reporting kernel bugs. It's a very 
difficult world to penetrate if you're not already in it. A proper bug 
tracker would make things much easier.
-- 
Adam Williamson (he/him/his)
Fedora QA
Fedora Chat: @adamwill:fedora.im | Mastodon: @adamw@fosstodon.org
https://www.happyassassin.net

