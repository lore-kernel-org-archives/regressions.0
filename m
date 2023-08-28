Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CF536D
	for <regressions@lists.linux.dev>; Mon, 28 Aug 2023 00:38:21 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf1935f6c2so17236195ad.1
        for <regressions@lists.linux.dev>; Sun, 27 Aug 2023 17:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693183101; x=1693787901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8Nnj+xx91C3mCzVw2rmaHdKVaHYTfAhHznaHMLPJJk=;
        b=Ct+tFzQTdS0xBf+Vq0pxvTgTNlSbgZiw1oA0N5W2XW0kgeTJYLz6ReUaBP1sQvM52J
         N6qRGYJEWdo1GZW8Bim1HrnG704cQ/QXaENmcV/kGDyWvOKsvX26WRNwYAudk0XPTB5m
         JphvpKL6d9q26GjrGpPR6WYKZhVgx2AhFJ6qexK+qVZNOgMWbCiS+ldHjAeo6G+i8NJl
         XVeUwc6v/MT8SQTTNw9s7njxtwMatPdF7uW74FN3XO6GjscDJhMpCWEieDN/4GUIljOV
         Nu200gAWImBzA8dDRFsaYZUSyzZV9gr17VybaoOxb8DLcR7eLCsdnhhwGqDxjJy4XK2L
         L8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693183101; x=1693787901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8Nnj+xx91C3mCzVw2rmaHdKVaHYTfAhHznaHMLPJJk=;
        b=h+LZmm91pxUGZP7L5DiG1OWEvH3z2smtlKZnv5gr4kCSQQZPr6YRuLTU5CAbYO+P08
         Q7kbQ4DsWerbMfBcrJLYWzvlu1aiVcgyL/AZ/SQXZvBLVLrb0OqomAaYqBAS8DPYaiN8
         kYzo0qOhCx0i2JCCI5MDF0zqkWFvJtsWHwwzCiDWukN3FGA5806/1vsEK4xS9F4bIm1I
         im7xWJc6Jh0AHdDNKTgUnpO04dEJJeOipe0XiJr0WTgY/2ZVABXFLRt37Y2ieUGqcn2k
         odD8L0uAKJ732Kg9b9nZFrBn6uNb8vhLRwN65YirV+lA7bQ432gtMjtbt+BJGoC1fnuA
         yYbA==
X-Gm-Message-State: AOJu0YznvAJ9+BUbNMjAVk0/ymyOd/0RbYkIi5yNZWPceFjURhkaD4ky
	dBLbZKfP6nGP5yiJPMt38bA=
X-Google-Smtp-Source: AGHT+IGyoVA9+6D2lacahIUtZSy8OO08NsxArKyJTJhxMpin/a4KmDdnmxm0aCVL8jl9NJj1HkAeAg==
X-Received: by 2002:a17:903:230c:b0:1b8:3936:7b64 with SMTP id d12-20020a170903230c00b001b839367b64mr38216752plh.1.1693183100944;
        Sun, 27 Aug 2023 17:38:20 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001b8943b37a5sm5860305plb.24.2023.08.27.17.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 17:38:20 -0700 (PDT)
Message-ID: <39e8e28e-9d86-8be5-9c2f-1412995c7f16@gmail.com>
Date: Mon, 28 Aug 2023 07:38:17 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: 6.1.48 regression at boot : WARNING: CPU: 0 PID: 0 at
 arch/x86/kernel/alternative.c:572 apply_returns+0x1e4/0x210
Content-Language: en-US
To: =?UTF-8?Q?Toralf_F=c3=b6rster?= <toralf.foerster@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Borislav Petkov <bp@alien8.de>
References: <3d6fbd04-2861-91a8-938c-45195f307eed@gmx.de>
 <ZOsv0h6bsYSnfg2b@debian.me> <04f1b4fb-5441-6178-7ae3-39479571b339@gmx.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <04f1b4fb-5441-6178-7ae3-39479571b339@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2023 02:23, Toralf Förster wrote:
> On 8/27/23 13:13, Bagas Sanjaya wrote:
>> Thanks for the regression report. I'm adding it to regzbot (as stable-specific
>> regression for now):
>>
>> #regzbot ^introduced: v6.1.47..v6.1.48
> 
> fixed by 6.1.49 - thx
> 

#regzbot resolved: fixed by newer stable release

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

