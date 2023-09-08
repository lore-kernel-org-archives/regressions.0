Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEC4C93
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 16:18:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-414ba610766so374191cf.0
        for <regressions@lists.linux.dev>; Fri, 08 Sep 2023 09:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694189884; x=1694794684; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mPUcamzfc2K80JTRcSh37SDRo35tgdoJ7iQ161IJKQ=;
        b=XF1T0VVJdgwMPmZ3Fmje9TAY2jNwSYGBWT1GIN1TCnYTgbZ2+loPw/iJgLNa1Eq4n8
         LP1sae9rBVjX7fR1T2ovjJVdtpFIt9sETXGWjEfmNmkLrSx24bHLHvDEKrv9T/m2/7PZ
         +ynVYbXqtjIk2KStIjNz2uiBEusbzI0/QQS6CdDg74d4aideRCsJlBPA9pXgN8H6NRTR
         o8TpTONzBSMo4RGh3FzHcfcZ6kN5dkVy7IMPJfO0Td5tWRIBNYt6MNvHlm92a674UwDn
         WdfXavnGzVT/r9gfF61jhLGu5b5TjAUzudTUEYqWj6GJicV90PIZCDoF+0THskxNAXKs
         P1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694189884; x=1694794684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mPUcamzfc2K80JTRcSh37SDRo35tgdoJ7iQ161IJKQ=;
        b=DvgmZJWkeQFFc3hbetNvksEqSnJE65esCgCOD2wgxUJjGpRWOjP9woEiBNE/2dC1R0
         d3mq8LAMHY3NIl9AHyH1l4/9T5DQA/DKIfVaplSaElNlGC9/uHzJXWeQtpVIkKHEjXbM
         yb3bssRtKWN2cz2ZENX3n/Z+/krm72jO50LpJ1phOthQYuvtsBh/HdrGCqhN7R3xvV5/
         ezKcOudDSK3/Wl72YtEAcPpcFqWa5rkVRvPKHSCm3jtXkLdCKnSMJGZXg2WjWX7zqvOY
         HvHPNqxmEMm3xxMa8/nfYQtgR/39+nMitK4YwtjGZKDw7XnXZo6JQrvqDROQpMTI15oT
         cdjQ==
X-Gm-Message-State: AOJu0YyBW0qhWKsIrldbas6C52sqisFbLAGvInfYHXn6PG3gKO8gQplB
	LSbcAuv9cmvMjvmjxKLGok7cPbPqCArTEK7sBos1ug==
X-Google-Smtp-Source: AGHT+IHtLyt9dQcuUoOfYf1XNrLfr+Mr+5RBsmmaFIHjpge9TqIpMpMbRpg9LYwLrIjKFnT+OXss3NklaJ5bD0W+MUw=
X-Received: by 2002:a05:622a:148b:b0:405:47aa:7ffd with SMTP id
 t11-20020a05622a148b00b0040547aa7ffdmr220836qtx.19.1694189884551; Fri, 08 Sep
 2023 09:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829114816.GA508985@ziqianlu-dell> <ZO3hQ0rbr8QuUjVI@debian.me>
 <20230829125134.GA509331@ziqianlu-dell> <20230829125939.bcg2r6hwqf45npko@box.shutemov.name>
 <20230829140451.GA509854@ziqianlu-dell> <20230907131409.masxz42ik6u456qp@box.shutemov.name>
 <20230908060230.GA283801@ziqianlu-dell> <20230908123233.dpbpohgrbyyxekzk@box.shutemov.name>
 <202309080856.F066F92C98@keescook>
In-Reply-To: <202309080856.F066F92C98@keescook>
From: Ard Biesheuvel <ardb@google.com>
Date: Fri, 8 Sep 2023 18:17:53 +0200
Message-ID: <CAGnOC3aG9BuoVEGs4LQhhczdhAF0gFBmXR7GXKAf4Z8FPTb1PQ@mail.gmail.com>
Subject: Re: kexec reboot failed due to commit 75d090fd167ac
To: Kees Cook <keescook@chromium.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Aaron Lu <aaron.lu@intel.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 5:58=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> On Fri, Sep 08, 2023 at 03:32:33PM +0300, Kirill A. Shutemov wrote:
> > On Fri, Sep 08, 2023 at 02:02:30PM +0800, Aaron Lu wrote:
> > > On Thu, Sep 07, 2023 at 04:14:09PM +0300, Kirill A. Shutemov wrote:
> > > > On Tue, Aug 29, 2023 at 10:04:51PM +0800, Aaron Lu wrote:
> > > > > > Could you show dmesg of the first kernel before kexec?
> > > > >
> > > > > Attached.
> > > > >
> > > > > BTW, kexec is invoked like this:
> > > > > kver=3D6.4.0-rc5-00009-g75d090fd167a
> > > > > kdir=3D$HOME/kernels/$kver
> > > > > sudo kexec -l $kdir/vmlinuz-$kver --initrd=3D$kdir/initramfs-$kve=
r.img --append=3D"root=3DUUID=3D4381321e-e01e-455a-9d46-5e8c4c5b2d02 ro net=
.ifnames=3D0 acpi_rsdp=3D0x728e8014 no_hash_pointers sched_verbose selinux=
=3D0"
> > > >
> > > > I don't understand why it happens.
> > > >
> > > > Could you check if this patch changes anything:
> > > >
> > > > diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compre=
ssed/misc.c
> > > > index 94b7abcf624b..172c476ff6f3 100644
> > > > --- a/arch/x86/boot/compressed/misc.c
> > > > +++ b/arch/x86/boot/compressed/misc.c
> > > > @@ -456,10 +456,12 @@ asmlinkage __visible void *extract_kernel(voi=
d *rmode, memptr heap,
> > > >
> > > >   debug_putstr("\nDecompressing Linux... ");
> > > >
> > > > +#if 0
> > > >   if (init_unaccepted_memory()) {
> > > >           debug_putstr("Accepting memory... ");
> > > >           accept_memory(__pa(output), __pa(output) + needed_size);
> > > >   }
> > > > +#endif
> > > >
> > > >   __decompress(input_data, input_len, NULL, NULL, output, output_le=
n,
> > > >                   NULL, error);
> > > > --
> > >
> > > It solved the problem.
> >
> > Looks like increasing BOOT_INIT_PGT_SIZE fixes the issue. I don't yet
> > understand why and how unaccepted memory is involved. I will look more
> > into it.
> >
> > Enabling CONFIG_RANDOMIZE_BASE also makes the issue go away.
>
> Is this perhaps just luck? I.e. does is break ever on, say, 1000 boot
> attempts? (i.e. maybe some position is bad and KASLR happens to usually
> avoid it?)
>
> > Kees, maybe you have a clue?
>
> The only thing I can think of is that something isn't being counted
> correctly due to the size of code, and it just happens that this commit
> makes the code large enough to exceed some set of mappings?
>
> >
> > diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
> > index 9191280d9ea3..26ccce41d781 100644
> > --- a/arch/x86/include/asm/boot.h
> > +++ b/arch/x86/include/asm/boot.h
> > @@ -40,7 +40,7 @@
> >  #ifdef CONFIG_X86_64
> >  # define BOOT_STACK_SIZE     0x4000
> >
> > -# define BOOT_INIT_PGT_SIZE  (6*4096)
> > +# define BOOT_INIT_PGT_SIZE  (7*4096)
>
> That's why this might be working, for example? How large is the boot
> image before/after the commit, etc?
>

Not sure why these changes would make a difference here, but choking
on accept_memory() on a non-TDX suggests that init_unaccepted_memory()
is poking into unmapped memory before it even decides that the
unaccepted memory does not exist.

init_unaccepted_memory() has

        ret =3D efi_get_conf_table(boot_params, &cfg_table_pa, &cfg_table_l=
en);
        if (ret) {
                warn("EFI config table not found.");
                return false;
        }

which looks for <guid, phys_addr> tuples in an array pointed to by the
EFI system table, and if either of those is not mapped, things can be
expected to explode.

The only odd thing there is that this code is invoked after setting up
the 'demand paging' logic in the decompressor.

If you haven't yet, could you please retry the kexec boot with
earlyprintk=3Dtty<insert your UART params here>?
