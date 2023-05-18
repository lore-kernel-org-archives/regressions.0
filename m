Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1431991A
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 11:58:21 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3078aa0b152so1288869f8f.3
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684411099; x=1687003099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFi8EQIDSIliJH0YLEPNyiyKalRl7GPrfc3c2UtrEEk=;
        b=AX7RJ0sbKYAAasE6dmC9RrrnAaeg0hnpwkjhDWTnmRpr/N+ss/krb6UpG2dHTTgpYT
         PyDS3JWmGDa60SEzKDsm2yUDzEDo7kv+k6ubFn9djZIpARuy7NHEmNbSjX0OyPs2sHiD
         8ug2PE8x8mD16QC+dNYTacGXtXskT8oLvK9qe66yD0nLebkxasEMtHWnuBIyS+J8I13g
         Ow1o1ctIA0JsbCez9TnmQtRK8HDG9t6a8Qf+FPhleZ4rdmUpk7dVs6Ss8q4Jq6Ab7UW7
         z6veVifBrGXAXcngodjyVFCOmjqssWs7kJOBDqci4ZymBdBRWtia2AtisEHVU31+nXdI
         hfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684411099; x=1687003099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFi8EQIDSIliJH0YLEPNyiyKalRl7GPrfc3c2UtrEEk=;
        b=cOBXbmOcZYlPUO9sStrmecdDw4tGA3kictjbNxs26CO74XsPMM6hdfQ409HZHhKN7M
         hPcWMMjfVDn0WQxwCdovQxBU0GlV+K94XsSPCJGf4MuuoZVe6sC6b6MqmSjsrLVv/LaW
         ciUhne+iWvfVKvos8WGZZydjCumvNnibhoOGbkNlz6PA8HDee83MPvqMB4doI2rXOchF
         ojwlFnwotvDhz3n7WXdXzRzkWCJCb3Udkn1YE9O6+gdohPlVuUa1IWrsv8L19vE/QG4w
         6DDW84bzwKvKF2/gRhi/va/PNfcMX4BIUcBpapiyUXmkuZLQxgw0G5yPohBjIPDcxRqt
         vtNg==
X-Gm-Message-State: AC+VfDxBmcRp7IKtjiv9jiGRH3k+uXtSJGAdGbn3Aa/ULcQoC4B8Yzdl
	NbQt8InTQiiBkZnpEOlUY6NoHwzhDZ8vojxLZXcgew==
X-Google-Smtp-Source: ACHHUZ5Zhzw8//6PHc6fe09JAMiSmooeV+itY4wTL+wrHP9vl8xE+6OnfQ55/WTl/Lcei712A3nkgc00F/V6FHxzMw8=
X-Received: by 2002:adf:f346:0:b0:2dc:c0da:409 with SMTP id
 e6-20020adff346000000b002dcc0da0409mr1477604wrp.27.1684411099389; Thu, 18 May
 2023 04:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy> <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <20230518-mobilize-dipper-051dfbc41971@wendy> <CAHVXubhpkkC_1sYkHJvjuHB24YhmHJJ_ZvjRhzaqvygCvfbRnw@mail.gmail.com>
 <20230518-cauterize-game-636a6aac4871@wendy>
In-Reply-To: <20230518-cauterize-game-636a6aac4871@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 18 May 2023 13:58:08 +0200
Message-ID: <CAHVXubgsHKfNaRgvXT0A=7cnnCMrZMrpvxEGrGobcytuFCsLKQ@mail.gmail.com>
Subject: Re: Bug report: kernel paniced when system hibernates
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <anup@brainfault.org>, Song Shuai <suagrfillet@gmail.com>, robh@kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, palmer@rivosinc.com, jeeheng.sia@starfivetech.com, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 12:35=E2=80=AFPM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> On Thu, May 18, 2023 at 10:41:19AM +0200, Alexandre Ghiti wrote:
> > On Thu, May 18, 2023 at 10:00=E2=80=AFAM Conor Dooley
> > <conor.dooley@microchip.com> wrote:
> > > On Thu, May 18, 2023 at 12:23:59PM +0530, Anup Patel wrote:
> > > > On Wed, May 17, 2023 at 8:26=E2=80=AFPM Alexandre Ghiti <alexghiti@=
rivosinc.com> wrote:
> > > > > On Wed, May 17, 2023 at 1:28=E2=80=AFPM Conor Dooley <conor.doole=
y@microchip.com> wrote:
> > > > > > On Wed, May 17, 2023 at 10:58:02AM +0200, Alexandre Ghiti wrote=
:
> > > > > > > On Tue, May 16, 2023 at 1:12=E2=80=AFPM Alexandre Ghiti <alex=
ghiti@rivosinc.com> wrote:
> > > > > >
> > > > > > > > On Tue, May 16, 2023 at 11:24=E2=80=AFAM Song Shuai <suagrf=
illet@gmail.com> wrote:
> > > > > > > > I actually removed this flag a few years ago, and I have to=
 admit that
> > > > > > > > I need to check if that's necessary: the goal of commit 333=
5068f8721
> > > > > > > > ("riscv: Use PUD/P4D/PGD pages for the linear mapping") is =
to expose
> > > > > > > > the "right" start of DRAM so that we can align virtual and =
physical
> > > > > > > > addresses on a 1GB boundary.
> > > > > > > >
> > > > > > > > So I have to check if a nomap region is actually added as a
> > > > > > > > memblock.memory.regions[] or not: if yes, that's perfect, l=
et's add
> > > > > > > > the nomap attributes to the PMP regions, otherwise, I don't=
 think that
> > > > > > > > is a good solution.
> > > > > > >
> > > > > > > So here is the current linear mapping without nomap in openSB=
I:
> > > > > > >
> > > > > > > ---[ Linear mapping ]---
> > > > > > > 0xff60000000000000-0xff60000000200000    0x0000000080000000  =
       2M
> > > > > > > PMD     D A G . . W R V
> > > > > > > 0xff60000000200000-0xff60000000e00000    0x0000000080200000  =
      12M
> > > > > > > PMD     D A G . . . R V
> > > > > > >
> > > > > > > And below the linear mapping with nomap in openSBI:
> > > > > > >
> > > > > > > ---[ Linear mapping ]---
> > > > > > > 0xff60000000080000-0xff60000000200000    0x0000000080080000  =
    1536K
> > > > > > > PTE     D A G . . W R V
> > > > > > > 0xff60000000200000-0xff60000000e00000    0x0000000080200000  =
      12M
> > > > > > > PMD     D A G . . . R V
> > > > > > >
> > > > > > > So adding nomap does not misalign virtual and physical addres=
ses, it
> > > > > > > prevents the usage of 1GB page for this area though, so that'=
s a
> > > > > > > solution, we just lose this 1GB page here.
> > > > > > >
> > > > > > > But even though that may be the fix, I think we also need to =
fix that
> > > > > > > in the kernel as it would break compatibility with certain ve=
rsions of
> > > > > > > openSBI *if* we fix openSBI...So here are a few solutions:
> > > > > > >
> > > > > > > 1. we can mark all "mmode_resv" nodes in the device tree as n=
omap,
> > > > > > > before the linear mapping is established (IIUC, those nodes a=
re added
> > > > > > > by openSBI to advertise PMP regions)
> > > > > > >     -> This amounts to the same fix as opensbi and we lose th=
e 1GB hugepage.
> > > > > >
> > > > > > AFAIU, losing the 1 GB hugepage is a regression, which would ma=
ke this
> > > > > > not an option, right?
> > > > >
> > > > > Not sure this is a real regression, I'd rather avoid it, but as
> > > > > mentioned in my first answer, Mike Rapoport showed that it was ma=
king
> > > > > no difference performance-wise...
> > >
> > > My point was that if someone has hugepages enabled & we handle this i=
n a
> > > way that causes the first hugepage to be unusable, is that not a
> > > regression? Whether hugepages provide a performance benefit is not
> > > really related to that question AFAICT.
> >
> > Not being able to map certain regions of the linear mapping with a 1GB
> > hugepage will happen, for example the kernel mapping is protected in
> > the linear mapping so that it can't be written: so we can only map
> > this region with 2MB hugepages. A firmware could mark a region as
> > "no-map" and there again we would not be able to use a 1GB hugepage. I
> > don't see that as a regression as the intention is not to *always* use
> > 1GB hugepages, but rather to use them when possible. Does that make
> > sense?
>
> Ah, so it was as I expected - I don't/didn't properly understand
> hugepages. Thanks.
>
> > > Were you suggesting reverting hugepage support entirely in your origi=
nal
> > > message? If we entirely remove hugepage support, then I guess the fir=
st
> > > hugepage cannot be lost..
> >
> > Given Mike Rapoport's recent talk, I think that's an option, yes.
> >
> > >
> > > > > > > 2. we can tweak pfn_is_nosave function to *not* save pfn corr=
esponding
> > > > > > > to PMP regions
> > > > > > >     -> We don't lose the 1GB hugepage \o/
> > > > > > > 3. we can use register_nosave_region() to not save the "mmode=
_resv"
> > > > > > > regions (x86 does that
> > > > > > > https://elixir.bootlin.com/linux/v6.4-rc1/source/arch/x86/ker=
nel/e820.c#L753)
> > > > > > >     -> We don't lose the 1GB hugepage \o/
> > > > > > > 4. Given JeeHeng pointer to
> > > > > > > https://elixir.bootlin.com/linux/v6.4-rc1/source/kernel/power=
/snapshot.c#L1340,
> > > > > > > we can mark those pages as non-readable and make the hibernat=
ion
> > > > > > > process not save those pages
> > > > > > >     -> Very late-in-the-day idea, not sure what it's worth, w=
e also
> > > > > > > lose the 1GB hugepage...
> > > > > >
> > > > > > Ditto here re: introducing another regression.
> > > > > >
> > > > > > > To me, the best solution is 3 as it would prepare for other s=
imilar
> > > > > > > issues later, it is similar to x86 and it allows us to keep 1=
GB
> > > > > > > hugepages.
> > > > > > >
> > > > > > > I have been thinking, and to me nomap does not provide anythi=
ng since
> > > > > > > the kernel should not address this memory range, so if it doe=
s, we
> > > > > > > must fix the kernel.
> > > > > > >
> > > > > > > Let me know what you all think, I'll be preparing a PoC of 3 =
in the meantime!
> > > > > >
> > > > > > #3 would probably get my vote too. It seems like you could use =
it
> > > > > > dynamically if there was to be a future other provider of "mmod=
e_resv"
> > > > > > regions, rather than doing something location-specific.
> > > > > >
> > > > > > We should probably document these opensbi reserved memory nodes=
 though
> > > > > > in a dt-binding or w/e if we are going to be relying on them to=
 not
> > > > > > crash!
> > > >
> > > > Depending on a particular node name is fragile. If we really need
> > > > information from DT then I suggest adding "no-save-restore" DT
> > > > property in reserved memory nodes.
> > >
> > > We can add whatever properties we like, but where does that leave us =
for
> > > the systems in the wild where their reserved memory nodes do not cont=
ain
> > > a "no-save-restore" property or "no-map"?
> > >
> > > Ideally, yes, we do not depend on the node name and instead use expli=
cit
> > > properties - but I think we may be "forced" to fall back to checking =
the
> > > node-name to cover the opensbi versions that do not contain one.
> > > LMK if I have missed something there!
> >
> > Yes I agree with you, we can implement Anup's solution #1, but we need
> > to fix the kernel anyway since if we don't, that would make the kernel
> > hibernation support depend on a certain version of openSBI.
>
> It's not unreasonable to have things depend on versions of the SBI
> implementation, but it is if they're not things that can be probed using
> the standard interfaces!
>
> > > > > Yes, you're right, let's see what Atish and Anup think!
> > > >
> > > > I think we have two possible approaches:
> > > >
> > > > 1) Update OpenSBI to set "no-map" DT property for firmware
> > > >     reserved regions. We were doing this previously but removed
> > > >     it later for performance reasons mentioned by Alex. It is also
> > > >     worth mentioning that ARM Trusted Firmware also sets "no-map"
> > > >     DT property for firmware reserved regions.
> > > >
> > > > 2) Add a new "no-save-restore" DT property in the reserved
> > > >     memory DT bindings. The hibernate support of Linux arch/riscv
> > > >     will use this DT property to exclude memory regions from
> > > >     save-restore. The EFI implementation of EDK2 and U-Boot
> > > >     should do the following:
> > > >     1) Treat all memory having "no-map" DT property as EFI
> > > >         reserved memory
> > > >     2) Treat all memory not having "no-map" DT property and
> > > >         not having "no-save-restore" DT property as EfiBootServices=
Data
> > > >     3) Treat all memory not having "no-map" DT property and
> > > >          having "no-save-restore" DT property as EfiRuntimeServiceD=
ata
> > > >          (Refer,
> > > > https://devicetree-specification.readthedocs.io/en/latest/chapter3-=
devicenodes.html#reserved-memory-and-uefi)
> > > >
> > > > Personally, I am leaning towards approach#1 since approach#2
> > > > will require changing DeviceTree specification as well.
> > >
> > > #1 is by far the simpler option of the two, if the consensus is that =
the
> > > loss of the first hugepage is not a problem (or if it is a problem th=
at
> > > realistically is unavoidable).
> >
> > The "no-map" property does not provide much security anyway: the
> > kernel should not touch a page that is reserved (this is where I may
> > be wrong), so the real fix to this issue is to make the hibernation
> > process not save those pages.
>
> Right, the kernel clearly needs to be able to handle the regions. I, at
> least, was commenting on re-using no-map versus creating new properties
> for this situation.
> I was advocating for re-using the property & changing the kernel so as
> not to touch the regions during hibernation.
>
> > > There's something else I think I might be missing here, given the
> > > scattered nature of the reporting. This is not a problem for a system
> > > that does not implement hibernation, which was only added in v6.4-rc1=
?
> > >
> > > That would make it not a regression after all. I think I misunderstoo=
d
> > > the report on sw-dev to mean that this was a problem generally after
> > > v6.4-rc1, which would have been one. Could someone please confirm tha=
t?
> >
> > The problem is only present since v6.4-rc1, that's not a regression,
> > it's just that both patches landed at the same time and gave rise to
> > this issue.
>
> Sick. Glad to be wrong here!
>
> #regzbot resolve: not a regression, feature introduced this cycle
>
> > > If it only affects hibernation, and is not a regression, should we ma=
ke
> > > ARCH_HIBERNATION_POSSIBLE def_bool n in Kconfig until we have agreed =
on
> > > a solution for the problem?
>
> Any thoughts on this one?

Ahah, I don't know, I tried to dodge the question :) But if we don't
fix this issue, hibernation won't work so is it enough?
