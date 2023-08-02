Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4AA63B1
	for <regressions@lists.linux.dev>; Wed,  2 Aug 2023 12:38:29 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bba04b9df3so53938055ad.0
        for <regressions@lists.linux.dev>; Wed, 02 Aug 2023 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690979909; x=1691584709;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCaJfRDcQ/j8NvxBseF28uGTZsyouYPenyGPtBvs7Ag=;
        b=OQVD00X+fFdoFOV6AIVr9E8zFxSx5ZSdlWn1z9cEHpSHI7fNoaOxt+4YE4hIq/sS0H
         Tc5t+QY/Af0FPcb0UbOUTKbN/wjHt3x+M1L1EhJbNwv2Yeft9fGLKiBOmOdaJlFBaMCB
         SA+05FZQ3LxRO8tWClstvW84jkw6GQQYE85CC2iYP4dk1nwSuSKe+ktwGc1OoOxNufBt
         rHzA+llAGUZSu6H62F4OtIV8VCF0Qoh62wsylG1k4K0GiuIkbpbwqUISRAEgYjMvqv3H
         xunEdkFirMg+HlQItswVt+0Ps8H3/2T6EIGW7GF0juUEzQ+jtxGI0Lvs97p+PayymOr1
         XKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690979909; x=1691584709;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCaJfRDcQ/j8NvxBseF28uGTZsyouYPenyGPtBvs7Ag=;
        b=ZcKDjZT8WSKVshMtDyq75jXjTqAUknXW61e27ukw7b3OFxoVEADztEoD3zhMXj6/T2
         83uo3y/WkszoNT7zD9IGMkJpPI2fMDxjT0bHZQVljFNlm/6I3rjYZjQ6LW9h0YADaTUa
         cBHlGHsIF94LFPsucHj7T2bkzEvULwgf06Q8lQq4BUaDrBTgOC90DpLModElVegSykjf
         jGl1N/yVKYMnyoP37jm80XwcniUCg1s43Pd1tGgZmQGy8o8P7Ruu7IudMLhczECba/Yc
         0vNXH2/NGMGLCTwHz6+p4/qZCgCevLL4/Z4WK+BY5dzaan6YdK6tHRneZPGt1SCxEbhR
         Y2sw==
X-Gm-Message-State: ABy/qLZ+vPqCSHqF7+yv3f8WC5s4tJMleyfR0C9VuyBCytwb3cXfRS9h
	Og13YmJ4XmD14tD6UIukhW8=
X-Google-Smtp-Source: APBJJlHnD8LH6jLPiA1ybE8b0xGJc/HDo+xItbPoicPJ8NQ6sOjqNAamf9Z3J9pUfqgq/hovKFa2Sw==
X-Received: by 2002:a17:903:2343:b0:1bb:a85c:23cc with SMTP id c3-20020a170903234300b001bba85c23ccmr20078880plh.15.1690979909291;
        Wed, 02 Aug 2023 05:38:29 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id m24-20020a170902bb9800b001b87bedcc6fsm12310621pls.93.2023.08.02.05.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 05:38:28 -0700 (PDT)
Message-ID: <80e4fe8d-96d0-2eba-918b-7c36f8341568@gmail.com>
Date: Wed, 2 Aug 2023 19:38:23 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: Kernel memory management bug at mm/migrate.c:662 when
 flushing caches
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alistair Popple <apopple@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Marco <rodomar705@protonmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <428d8fe9-8c19-ddba-b36e-7db5524e8d04@gmail.com>
In-Reply-To: <428d8fe9-8c19-ddba-b36e-7db5524e8d04@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/08/2023 18:08, Bagas Sanjaya wrote:
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217747
> #regzbot title: kernel memory bug when cleaning hugepages before QEMU boot
> 

The reporter confirmed that this regression is (Open)ZFS-specific,
so:

#regzbot invalid: out-of-tree (OpenZFS) regression

Sorry for inconvenience.

-- 
An old man doll... just what I always wanted! - Clara

