Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6729A8
	for <regressions@lists.linux.dev>; Mon, 29 Aug 2022 09:16:37 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id nc14so9519987ejc.4
        for <regressions@lists.linux.dev>; Mon, 29 Aug 2022 02:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EZyAKGxDJWQWEgkfKzptYNGJYnD9auk8Xlm/WrZ7jdU=;
        b=SEiUOGxs2FjZ6CWTcCv/2x4sP3IDGnJMgDBUtWt06puGcDsshwOwYTNGCTQYeP2lcZ
         wO0pKoFFjGbKPfEZyCbsYy7bTMeyLePK1O0Au0lMnwzZBo0dIsRFCQWQlv3chYndtXPz
         COb8Oubr+DEjPJ5fFoFI8t7J2bZIsijUcca7BCPEsVVoKeX2ikzRPBhvI+/noSXd8/6i
         y4ansTSSKUzGuwvXcWLW3zoF6KG79eszl7QJLsY+zfAiiByHdqRC/M6Ysma1y6bHC3z2
         g1ocEkKXVhKk3jLaJ7nz6cIxpZaCtetRYOK6DUiELLQC4n0Bve2t7B5rIvKPRbnkFApI
         sVDA==
X-Gm-Message-State: ACgBeo1wh+4/Iq6/IuGY95sJ1OCl07u2Bipq+hOOfmHD/mQ2lq40OUkQ
	F12OCN3Abiw4GxDs/0xtKlA=
X-Google-Smtp-Source: AA6agR7L7Zo8+3boKcduPEH8hNCqgDk58TMtCsjz06qKSqqKWkUKDWoye5odSbnSHlehicIrNvED8g==
X-Received: by 2002:a17:906:9752:b0:738:364a:4ac with SMTP id o18-20020a170906975200b00738364a04acmr13022013ejy.759.1661764596299;
        Mon, 29 Aug 2022 02:16:36 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id c15-20020a056402120f00b0043bbb3535d6sm5398344edw.66.2022.08.29.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 02:16:35 -0700 (PDT)
Message-ID: <b772c39f-c5ae-8f17-fe6e-6a2bc4d1f83b@kernel.org>
Date: Mon, 29 Aug 2022 11:16:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Weird RIP printed in BUGs [was: 6.0 tty regression, NULL pointer
 deref in flush_to_ldisc]
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 Oleg Nesterov <oleg@redhat.com>
References: <4b4bba5d-d291-d9fa-8382-cdc197b7ed35@redhat.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <4b4bba5d-d291-d9fa-8382-cdc197b7ed35@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29. 08. 22, 10:37, Hans de Goede wrote:
> [   28.626537] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   28.626555] #PF: supervisor instruction fetch in kernel mode
> [   28.626563] #PF: error_code(0x0010) - not-present page
> [   28.626569] PGD 0 P4D 0
> [   28.626580] Oops: 0010 [#1] PREEMPT SMP PTI
> [   28.626589] CPU: 2 PID: 8 Comm: kworker/u8:0 Tainted: G         C  E      6.0.0-rc2+ #102
> [   28.626598] Hardware name: MPMAN Converter9/Converter9, BIOS 5.6.5 07/28/2015
> [   28.626604] Workqueue: events_unbound flush_to_ldisc
> [   28.626617] RIP: 0010:0x0
> [   28.626633] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.

Irrelevant to the original report, this new message format (the old 
being "Bad RIP value") confuses me. It always makes me think how can RIP 
be -42. So can we either:

1) print regs->ip value (0x0000000000000000) instead of prologue value 
(regs->ip - 42 = 0xffffffffffffffd6) here? Even though we really pass 
"regs->ip - 42" to copy_code()), or

2) don't print "RIP" in that message. So only "at 0xffffffffffffffd6"

? (I can send a patch for whichever is preferred, if anything.)

thanks,
-- 
js
suse labs

