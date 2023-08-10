Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE601EAD9
	for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 20:32:00 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d45caf42d73so1242354276.2
        for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691699519; x=1692304319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g59HiU23KR/p51M+HUju4XZbajYYWPrjBLvP531ccBY=;
        b=sQJbvYiD2y8zgmqroUUInNm5qo+9svPvMKGI2Q5EosMEVYq8fVpXbepiuBmM8UHsu5
         1xA3VsZZ74iKcPdDnDhxZC4uSHJK54aT4DlNWO8hwfA4JiuD7t4CWPxiXrP/nbUOHo0Q
         yT7umT2X5oKCRGZ0takoWpPqSlsZp0v9MrOa7YHwyPU0B+IqdvprJriglT/mbQ+sHNxD
         UMiNvorIcqNnTefZhdQ/k6OBDOutLULbBDm66lgBSHMzlUCl+hCesN16wLAgGaphn/wz
         PxDkPKB3lDFs+LRlcoBwp7Zp/Zw7wNOABXSpvJcfjHw/n52956z3zBvb0UYdl2a6nkaO
         Z6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691699519; x=1692304319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g59HiU23KR/p51M+HUju4XZbajYYWPrjBLvP531ccBY=;
        b=fw8Dr2+KVx5rS6DyoI+mHLiRtIb7904co7DZcr3s5Z+LmikGbdJqZTdOry5ZykRuMS
         UHpOsti7dR81bPuPSTF4T04apfGwMsXpBO2pqeBINR6ulrsUqSCFurT220wY0USOjyJV
         InQEB5c/NSTZ/XKnbeeR/x7CTEBh2eNKMBh3CGJiJSnxBHbIO8/KA+nIiFAI7S/6RWyH
         tyJwNvfZ08WAOEPz9C7jYFsEZGScHWwqKPg9j4DgIyQqMpKFaegEEsZ9XwKoE+EhS1P4
         BBHkM0tp8U9scJvHa8iIUmDivD0TRobxOJGk6T/ABxgsiH71CvDRkEPLVwY49UmduijV
         z36g==
X-Gm-Message-State: AOJu0Yx3uCVVeDUGU/PAN5lVouyrzmXVqH9jOfQR+NQcqUl35CQx71kL
	6g+kCVfogHBK2BeczZ2TKl3ufWN4qKUy/eRnd57XQA==
X-Google-Smtp-Source: AGHT+IF8GAFo+XXfl6EEGjTASUeLQcv985qmMnxxeDdunk/11wQEl8xfkhkwuBI70mFIU+5epiXdNgUabufZRRazq9w=
X-Received: by 2002:a25:c7c6:0:b0:d06:ae7d:8664 with SMTP id
 w189-20020a25c7c6000000b00d06ae7d8664mr3581227ybe.29.1691699519368; Thu, 10
 Aug 2023 13:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
 <CAJuCfpE6K6x7EKAr2rtW1Gn+1oht6w2qZSZ2bGATfoe8C8fJhA@mail.gmail.com> <CAGudoHEU62Rpp+uJakCFgKC36y3th=Qx+jE+b7KJh6_jeH7cNg@mail.gmail.com>
In-Reply-To: <CAGudoHEU62Rpp+uJakCFgKC36y3th=Qx+jE+b7KJh6_jeH7cNg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Aug 2023 13:31:48 -0700
Message-ID: <CAJuCfpF=Y4DfOcb8YzU5eLpcxyTEP+houL1ud1k25_qweiV4-g@mail.gmail.com>
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

On Wed, Aug 9, 2023 at 2:07=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> > On Fri, Aug 4, 2023 at 6:06=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com=
> wrote:
> >>
> >> On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote=
:
> >> >>
> >> >> I know of these guys, I think they are excluded as is -- they go
> >> >> through access_remote_vm, starting with:
> >> >>         if (mmap_read_lock_killable(mm))
> >> >>                 return 0;
> >> >>
> >> >> while dup_mmap already write locks the parent's mm.
> >> >
> >> > Oh, you're only worried about vma_start_write()?
> >> >
> >> > That's a non-issue. It doesn't take the lock normally, since it star=
ts
> >> > off
> >> > with
> >> >
> >> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >> >                 return;
> >> >
> >> > which catches on the lock sequence number already being set.
> >> >
> >> > So no extra locking there.
> >> >
> >> > Well, technically there's extra locking because the code stupidly
> >> > doesn't initialize new vma allocations to the right sequence number,
> >> > but that was talked about here:
> >> >
> >> >
> >> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0L=
yKgEvsFaZNpDA@mail.gmail.com/
> >> >
> >> > and it's a separate issue.
> >> >
> >>
> >> I'm going to bet one beer this is the issue.
> >>
> >> The patch I'm responding to only consists of adding the call to
> >> vma_start_write and claims the 5% slowdown from it, while fixing
> >> crashes if the forking process is multithreaded.
> >>
> >> For the fix to work it has to lock something against the parent.
> >>
> >>         VMA_ITERATOR(old_vmi, oldmm, 0);
> >> [..]
> >>         for_each_vma(old_vmi, mpnt) {
> >> [..]
> >>                 vma_start_write(mpnt);
> >>
> >> the added line locks an obj in the parent's vm space.
> >>
> >> The problem you linked looks like pessimization for freshly allocated
> >> vmas, but that's what is being operated on here.
> >
> > Sorry, now I'm having trouble understanding the problem you are
> > describing. We are locking the parent's vma before copying it and the
> > newly created vma is locked before it's added into the vma tree. What
> > is the problem then?
> >
>
> Sorry for the late reply!
>
> Looks there has been a bunch of weird talking past one another in this
> thread and I don't think trying to straighten it all out is worth any
> time.
>
> I think at least the two of us agree that if a single-threaded process
> enters dup_mmap an
> down_writes the mmap semaphore, then no new thread can pop up in said
> process, thus no surprise page faults from that angle. 3rd parties are
> supposed to interfaces like access_remote_vm, which down_read said
> semaphore and are consequently also not a problem. The only worry here
> is that someone is messing with another process memory without the
> semaphore, but is very unlikely and patchable in the worst case -- but
> someone(tm) has to audit. With all these conditions satisfied one can
> elide vma_start_write for a perf win.
>
> Finally, I think we agreed you are going to do the audit ;)

Ack. I'll look into this once the dust settles. Thanks!

>
> Cheers,
> --
> Mateusz Guzik <mjguzik gmail.com>
