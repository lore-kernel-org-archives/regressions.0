Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808931C27
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 01:42:37 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-583c48a9aa1so30580607b3.1
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691199756; x=1691804556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rSm29+3cw5ZqZkXj3qFSUuwbm7CIlxZaN5vcndHFEY=;
        b=plN7LmsfHyvXpPp/HAgS7nXgIXteE8264IDa/o2tjDOX8unsmYk7EojQmTU5cUe+jV
         cjliykudifFvc7dLk6/DwgOH7+9X4MDhzMIsMQm/onYSQqKdwNZX8UqVTYKuJYl6Ha+O
         9WZhXR18J7XAaXbGAAwEXZ6ix0+UBKlzsTvo5jb05KSoRLL7qXvNBl5pNC1d6tXmVHMW
         SXIZLO8BP/DYmu5uEYaOUv39DLoLQlpwPV7BHp0dSXWIa4usOAk1N8w9mKX5V2IkcGwp
         8LnltCq2ELwZcpwu4a4wWAkmF+JXVmG8o9gLjlgrYUu/NaekCF94WvOvLo4XO9zaSpD4
         kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691199756; x=1691804556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rSm29+3cw5ZqZkXj3qFSUuwbm7CIlxZaN5vcndHFEY=;
        b=f1Ia4EPvRDxtkSwjLAvIW4BdkSzIaHESzW1Oa5wjp6ndumajC85TPIZkyjBbsHZyFs
         2hq3VOmxx199lTbg5n28mlw9c7T9RKjhaOL3nkKhsR2EALBHflR+8HDAY40n1Znw6Q2j
         MoS0uKT4UndBG/Rhd0HgjqXFy8gCjApvO1GQmEH2mLNbGTM2Mgn29M5zQ/tj2U3WCnHP
         2dDOj5is7IRGuRfsbdb1B9xI8rnEM1+zQcY6De4KAgudXsa/EsNOw+6z2P7yabRXLjOn
         SKU3rOOoKW5yoAGaoaXUTZcjsCiOVaCeihX/058OsBYtkbcA1vYgpoTdgKFLfHHedcfH
         ky6A==
X-Gm-Message-State: AOJu0Yy8Id6t8hlx10+VefpTyfHlrxFfN38mC23fJs9c/FxISHYeSi4A
	jy88rYxxuT8QG6TFjnDQpV0ISRVVZcaLL9cnxUf8Ug==
X-Google-Smtp-Source: AGHT+IG/HG+1FkEX7JGdDxDWOldixEM0zkMBonCbqf9PfeycEQrUJ/6TiOpqPkR0mOG06UahG1Vw84tdIhU/dMHaqDg=
X-Received: by 2002:a0d:db41:0:b0:570:2568:15e with SMTP id
 d62-20020a0ddb41000000b005702568015emr3945027ywe.43.1691199756040; Fri, 04
 Aug 2023 18:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com> <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
In-Reply-To: <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 18:42:23 -0700
Message-ID: <CAJuCfpE6K6x7EKAr2rtW1Gn+1oht6w2qZSZ2bGATfoe8C8fJhA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
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

On Fri, Aug 4, 2023 at 6:06=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >>
> >> I know of these guys, I think they are excluded as is -- they go
> >> through access_remote_vm, starting with:
> >>         if (mmap_read_lock_killable(mm))
> >>                 return 0;
> >>
> >> while dup_mmap already write locks the parent's mm.
> >
> > Oh, you're only worried about vma_start_write()?
> >
> > That's a non-issue. It doesn't take the lock normally, since it starts =
off
> > with
> >
> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >                 return;
> >
> > which catches on the lock sequence number already being set.
> >
> > So no extra locking there.
> >
> > Well, technically there's extra locking because the code stupidly
> > doesn't initialize new vma allocations to the right sequence number,
> > but that was talked about here:
> >
> >
> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0LyKg=
EvsFaZNpDA@mail.gmail.com/
> >
> > and it's a separate issue.
> >
>
> I'm going to bet one beer this is the issue.
>
> The patch I'm responding to only consists of adding the call to
> vma_start_write and claims the 5% slowdown from it, while fixing
> crashes if the forking process is multithreaded.
>
> For the fix to work it has to lock something against the parent.
>
>         VMA_ITERATOR(old_vmi, oldmm, 0);
> [..]
>         for_each_vma(old_vmi, mpnt) {
> [..]
>                 vma_start_write(mpnt);
>
> the added line locks an obj in the parent's vm space.
>
> The problem you linked looks like pessimization for freshly allocated
> vmas, but that's what is being operated on here.

Sorry, now I'm having trouble understanding the problem you are
describing. We are locking the parent's vma before copying it and the
newly created vma is locked before it's added into the vma tree. What
is the problem then?

>
> --
> Mateusz Guzik <mjguzik gmail.com>
