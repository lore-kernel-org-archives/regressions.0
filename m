Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361507E2
	for <regressions@lists.linux.dev>; Wed, 25 Oct 2023 00:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ica1r+IO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d18475ed4so3886678a91.0
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 17:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698192123; x=1698796923; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Q7n7eEoCIAK2rGAN6IyglN3NhntUutFp1NL35nDz+g=;
        b=ica1r+IOFpy9jl22fAyhZ8iLafzZUMoQ6JLowwkUM7k0/9GdlqDjw2eH2M046+tUb4
         dZ5XLSPUEa9eSp2ZxO3htbOFFb3k5hYgFShTfZVMQaYUox0rQyxxB2bGz78ywZbDAtUI
         +bqe22BdRAYOMJCdOwEEpAHA3zr6UKtadYq5BwEI+PhZrkVkefBfsjy6LPcmezr+nTiz
         4RZnn9tz0SqG7VuwwEexYcT8b2kL0FDTo4BfDfuGvGKnoGRO79H/mYr/xTnSukLFzDHk
         E0+/MAAost0mCbGW4DTmOsJ+cRjKIPwExUbYuWwLvePfYYmB0monnW3OacMACASg/h0h
         DSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698192123; x=1698796923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Q7n7eEoCIAK2rGAN6IyglN3NhntUutFp1NL35nDz+g=;
        b=OnMI63yLVXOuG3mmc8EoqIJV9cYsnCOitIkYI7yFXrbFw2HsAgDi8zY+44P7cl9UfO
         QMWMLEEaZL3sb55pJ4QRLnXdCOms9F/r0ccg3nyY/M+8GDDKQW0kSTKYWVgpCU2Dwrb/
         KZp4SFy65d+i4yCb9MgN/9jWwOW1318KONqEQTe0yvw/N7P7l7R0IxMJ+72n0GJNYB7o
         I7+GPEDQQ7/Rkovpj3dBvilOwuNlJZpghO3+FIj11qgqgNpGMQBKpGEdpAQMW5F3hKYa
         VtSQTOz3tXGFWFzdKWVsf47ut/wiCjuYQi+naes8UAuntFIrtHs/hP1WcluGZDBrIS4f
         VIhg==
X-Gm-Message-State: AOJu0Yxr5eDG37OcG+8uAuhCZ8szDLTrRLiz0vk5pFjA9qQHKzH34oZN
	3wIjikUi4onHutZA4YYL4DS4ZMeGiW8=
X-Google-Smtp-Source: AGHT+IHqp0fgXno/O+LMjdsIA9+MhoOLdZSecl/wbg0PuSHBIWNGSfBx3I4yfchMij2mH/s+AytZgA==
X-Received: by 2002:a17:90a:df8f:b0:27d:237b:558b with SMTP id p15-20020a17090adf8f00b0027d237b558bmr11985553pjv.5.1698192123380;
        Tue, 24 Oct 2023 17:02:03 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a01d500b0027732eb24bbsm10501271pjd.4.2023.10.24.17.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 17:02:02 -0700 (PDT)
Message-ID: <04c51182-97b7-4a10-a6f7-195da19358be@gmail.com>
Date: Wed, 25 Oct 2023 07:01:56 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Memleaks in offset_ctx->xa (shmem)
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Filesystem Development <linux-fsdevel@vger.kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, vladbu@nvidia.com
References: <429b452c-2211-436a-9af7-21332f68db7d@gmail.com>
 <f21c7064-dac1-4667-96c6-0d85368300ca@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <f21c7064-dac1-4667-96c6-0d85368300ca@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2023 21:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> Bagas, FWIW, before doing so you in the future might want to search lore
> for an abbreviated commit-id with a wildcard (e.g.
> https://lore.kernel.org/all/?q=6faddda6* ) and the bugzilla url (e.g.
> https://lore.kernel.org/all/?q=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D218039).
> Because then in this case you would have noticed that this was already
> discussed on the lists and Chuck asked to bring it to bugzilla for
> further tracking, so forwarding this likely was not worth it:
> https://lore.kernel.org/all/87ttqhq0i7.fsf@nvidia.com/
> 

Thanks for the tip reminder! I always forget it then...

-- 
An old man doll... just what I always wanted! - Clara

