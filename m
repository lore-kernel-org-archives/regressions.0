Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF7622
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 00:49:23 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56c884e1d74so1828352eaf.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 17:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691196562; x=1691801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC9Fhp6TCZrfcsmijl3oHForktkxpl5KZQtthV/moAA=;
        b=XmzIcXyhQzhX0FXd8abVbQ5vr4GQvF4B/upe2YhV2MbIpYJSp3DkmZkY8TECMAlUIO
         WTCgMfn4Q+QmGNgw5cF3/z4UPZZCrjcK06FTQK6nFocskU3E2ESjAZQKAMF8AGg+DMz5
         MO/+48/nM4TtIms6jxkF/nU69cRPi7qCbe3ga4fesKfond5NR6g8vqfG+kg5tKPtkG4B
         scnFviFayDlXJfvqxb8d0Hr78wsFREepRUuFuH3JDcVrM0MMfBKqUb3Wk8RGV6MN/uFC
         SkgBj0Y3rmrQFm+1ZDAKmujRBFq1sNfUlOtaEpuGina78P8a+RZNBnHiTZNuYJF/qawW
         XPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691196562; x=1691801362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC9Fhp6TCZrfcsmijl3oHForktkxpl5KZQtthV/moAA=;
        b=aZ8A7e+r0MPh4Va+5OZiDJCRtML/KVPIs23PsgfWUlmxIURjKl2AYpq/W78fH+WmLF
         IANcJPUpRFhgV40+CZxv/6VoEb53/TOJ4BWu0Qs+VNef5UKi3AxWny7SycOLym8+TQs6
         866hz1MM4dWYEFQ8j39AJuDz/HsDr6czTWrRtAqkwGv/XoumRAluJqK/RV49Gh4m1Bef
         D/m+p0Zu6a2qkl9ANmXO3eazl1fqm2PK7CX0bIaAXmLDnsvs5XtnEHdZW3xeF6xvowfg
         FBk4wQh5STVyqei61BVTzJfdhCnFtLx9xC//JsIQI45sgTXO/stPtgYfhslKuZt1ekgn
         Ug7w==
X-Gm-Message-State: AOJu0YwvIJhnkl6m0/0R9THYHY7k6aUjBhVXMP5Ynv+DutPWQHxNlD8V
	0WLVC/hVgy0q+994vIPoUa/pybavC8qIsvX9T58=
X-Google-Smtp-Source: AGHT+IFJ+zkF1c25z6S1/ksUOcukPgYD1oIxbWZwbBc/q6VFA3C2X7rYVDo6kvHYGGGXWhwRyRW6wkXCag6tb5+ZQqw=
X-Received: by 2002:a4a:7651:0:b0:566:ed69:422d with SMTP id
 w17-20020a4a7651000000b00566ed69422dmr3497184ooe.7.1691196562165; Fri, 04 Aug
 2023 17:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:7b87:0:b0:4f0:1250:dd51 with HTTP; Fri, 4 Aug 2023
 17:49:21 -0700 (PDT)
In-Reply-To: <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com> <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 5 Aug 2023 02:49:21 +0200
Message-ID: <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org, 
	regressions@leemhuis.info, bagasdotme@gmail.com, jacobly.alt@gmail.com, 
	willy@infradead.org, liam.howlett@oracle.com, david@redhat.com, 
	peterx@redhat.com, ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, 
	regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> On Fri, Aug 4, 2023 at 5:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com>
> wrote:
>>
>> On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>> >
>> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>> > >
>> > > I know of these guys, I think they are excluded as is -- they go
>> > > through access_remote_vm, starting with:
>> > >         if (mmap_read_lock_killable(mm))
>> > >                 return 0;
>> > >
>> > > while dup_mmap already write locks the parent's mm.
>> >
>> > Oh, you're only worried about vma_start_write()?
>> >
>> > That's a non-issue. It doesn't take the lock normally, since it starts
>> > off with
>> >
>> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
>> >                 return;
>> >
>> > which catches on the lock sequence number already being set.
>>
>> That check will prevent re-locking but if vma is not already locked
>> then the call will proceed with obtaining the lock and setting
>> vma->vm_lock_seq to mm->mm_lock_seq.
>
> The optimization Mateusz describes looks valid to me. If there is
> nobody else to fault a page and mm_users is stable (which I think it
> is because we are holding mmap_lock for write) then we can skip vma
> locking, I think.
>

mm_users is definitely *not* stable -- it can be bumped by
get_task_mm, which is only synchronized with task lock.

However, the other users (that I know of ) go through the mmap
semaphore to mess with anything which means they will wait for
dup_mmap to finish (or do their work first). I would be surprised if
there were any cases which don't take the semaphore, given that it was
a requirement prior to the vma patchset (unless you patched some to no
longer need it?). I would guess worst case the semaphore can be added
if missing.

What is guaranteed is that if the forking process is single-threaded,
there will be no threads added out of nowhere -- the only thread which
could do it is busy creating one in dup_mmap. If multithreaded
operation of the forking process was the only problem, that's it.

>>
>> >
>> > So no extra locking there.
>> >
>> > Well, technically there's extra locking because the code stupidly
>> > doesn't initialize new vma allocations to the right sequence number,
>> > but that was talked about here:
>> >
>> >
>> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0LyK=
gEvsFaZNpDA@mail.gmail.com/
>> >
>> > and it's a separate issue.
>> >
>> >           Linus
>


--=20
Mateusz Guzik <mjguzik gmail.com>
