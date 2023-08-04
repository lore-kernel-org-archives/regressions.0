Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1091BEE3
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 23:25:49 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a77ddccb2bso611091b6e.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 16:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691191549; x=1691796349;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ECpGsVgScrXWZOLp4MGlhJInQlqSJK5uh2ufnsxsdQ=;
        b=KN5ZYHb0WcW1urRTacMTcHcK1iJfsyKLuTL34dGK3epmEymYUfmkINYqz6aEbdMp+W
         zP3dEKtnz6JUtoqVZ1SnahfZCc5VVKFxGx/8h93CY/AxPITLLZOB6+xETO/sMYVRHySA
         TaMiFlxxDsv7HIJe00SxpQVu9Hn7GKNHwBxbOGtO1AXBFT+BEswiulBLKt6bP6OMt4wd
         12MBsdSJMyXvBwCe6D2ym2yxWn3SVy+r1EJz04/d6QPozmfj9tn6XaE+A3eVha3VW8Bw
         HsxwAfYJFsWa+JNVAHCA2y3A6DqjGG47Z5jkfZegfqiTqVqo78ji96xRiH5TdjogMFji
         HGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691191549; x=1691796349;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ECpGsVgScrXWZOLp4MGlhJInQlqSJK5uh2ufnsxsdQ=;
        b=XLBm/qIwor72JvN1RYHgpq43/Tc46p31jQOA2JuWrmBadXLpYgEZiWVYnnspUZCePz
         FDh3+9N1XDpSw8KF06pRAgnHYYLvRT5CnAvXC4QQtDNldBMEd6kZ9QiPaCRJ+gON5QFy
         LH2h3tJw4VjI8OZgR/ngbNp5k7uarTTMOwNtAc7p9Ckt2gSMWDJkb2+7djOPwI/61ED9
         /eJCoL2L/iRHTv/enPI/bYciU7hLmLYlJUtPa4anDtcX5ETenYULSi8N2wL2xPl8mKR9
         MSCwmBLwDKdncdjb4jj4AXeU5ehfP41gTINYkooPczzqpO9lRuN7iPbbhyPfuCBEXx1m
         qTWw==
X-Gm-Message-State: AOJu0YzDuboezwbREnNSi3PMEBoLKM0sMS9BhFZL82MX+nPsmbJHeSIR
	7vmSWBqJ++3AXMMWvn7mJCnQMa7lWD/6NZX38zc=
X-Google-Smtp-Source: AGHT+IGtBQglFMOFnETZZ/fmovN1PMvk23bCpNKojUYy5iXfJ0+vg0zUB8AJgZ4V2vFlc91Ap5FBtffJGXGc3wkjEE8=
X-Received: by 2002:a05:6808:3a7:b0:39c:7d50:ab86 with SMTP id
 n7-20020a05680803a700b0039c7d50ab86mr778649oie.29.1691191548939; Fri, 04 Aug
 2023 16:25:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 16:25:48 -0700 (PDT)
In-Reply-To: <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 01:25:48 +0200
Message-ID: <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, regressions@leemhuis.info, 
	bagasdotme@gmail.com, jacobly.alt@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, david@redhat.com, peterx@redhat.com, 
	ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Fri, 4 Aug 2023 at 14:46, Mateusz Guzik <mjguzik@gmail.com> wrote:
>>
>> I don't see it mentioned in the discussion, so at a risk of ruffling
>> feathers or looking really bad I'm going to ask: is the locking of any
>> use if the forking process is single-threaded? T
>
> Sadly, we've always been able to access the mm from other processes,
> so the locking is - I think - unavoidable.
>
> And some of those "access from other processes" aren't even uncommon
> or special. It's things like "ps" etc, that do it just to see the
> process name and arguments.
>

I know of these guys, I think they are excluded as is -- they go
through access_remote_vm, starting with:
        if (mmap_read_lock_killable(mm))
                return 0;

while dup_mmap already write locks the parent's mm.

I don't see any surprise relocks of the semaphore.

Granted, should someone *bypass* this mechanism the above would be moot.

-- 
Mateusz Guzik <mjguzik gmail.com>
