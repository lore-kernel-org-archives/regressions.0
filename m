Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CCD156644;
	Tue, 17 Dec 2024 08:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734422577; cv=none; b=YRkdmNP1ECpw7Uhp+0Q57vPmNk0T2FJsgLqFuq/Pk9xWIVcPp8E0uJGCmhXibONCV9odRLSO0Alb1RayYzRfpisXKvL/u6GqpX1I9KJh26UxSwB4KQpNyQPibKJYgMcEG2C3Y9XKrf0Ii2/tYyawCZ010BsdT8sj2kIegz84qYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734422577; c=relaxed/simple;
	bh=9Hp6gBaZltBdCJpha2XOW2+2tQX3NfSz4GmobUXmJL0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmAKwl1wLnZcQvUM1P5Nvxvz0gVYJQcMynxUyC7fe1CRYgQCAcYXajFDvOvq/+EUAuPqBUK1tINkFIhFGiBeKHNqSlVGNlDe9Ijfpf7x5np1vYlVpMyPBLykeJDi8DKXvkYF2PK3GJCuPv3LbTJHe+2IdllQleLlTyhSZrZIluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPKctoym; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPKctoym"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso98196a12.3;
        Tue, 17 Dec 2024 00:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734422572; x=1735027372; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I8KYznOvQ9Ns7fS2EG3QX401236xaX+oyKJLcRk8+uE=;
        b=QPKctoymF2VKaED0kcJNbqTcqvdjxIUt5TJAMa6sLA6W1h4gryuy9i6TyOnAoZLvIh
         /t2hM93qYK87sycrjyaa5FXy8iPEQQ7i1K5TeDIeQuqXBAW0InCO6mhRESzFeOiF2zFr
         uH1Mt2TT8EGtvvCEeZVilArA5SpDUhM0Fj9cPUrRwqCtxuV2dfBaBHJTNg6Up6wTFXB2
         1DXRc/lBG646RCMOQ8dX5n3lCHm0lfGOzF3szvaw41duY/qMA2O+qU825mLsb42wmvnP
         M/cMiayucrxA3dg8q7kv1Ha6ThUangecESnFL3OYqewnFecSk7p0+UWlvgGv3Z9QjHRL
         C8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734422572; x=1735027372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8KYznOvQ9Ns7fS2EG3QX401236xaX+oyKJLcRk8+uE=;
        b=JLjcsDLWGF0jAkdLAS/xGibVAq0fxli5gNuiQMyBoG/2GGc4T7paO6+pUO3JftkFnZ
         X3LJhyUUx3gcu9+GXHXnX5gZFRXvgkweYDeJEK96Mqzpoa5/vrBMGVqy1a5aw/9TByf2
         wAPp42fkCo4cCudhBVGzr/EjU6jxPaFKtjugAcJGsE2J+Y1E4/BAkIu+NhZ4+zz92WcC
         aW1Ae3shX0bcBX4+DQiJs6CU7lNl2HehhczXpnNuc0vvsVC/lV5LG8HjA15dhWUpKdLC
         twqS+XiWxJvSxTvmGApb2ZfoKz4zSriO9wfugb3+oAc4IxSqyKcuA13X3e8VUs/hugOA
         2M7w==
X-Forwarded-Encrypted: i=1; AJvYcCWDzbAhGGhIhuY9w+phZ0B+zQFqN1xzbQTG0pkBMCuztEv8Z3EPZDz82BReITXxKleZS8jZb07+0l6RFNDLbRk=@lists.linux.dev, AJvYcCWrdTIpE5+O63QE/gb/3KBVwtC0Y1zyTcRjwiKPw+w22nbq1NNQsuuguzGUjVlBKtPWkSZ8MaEhIF2g+tU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi1Lq4shbuVCsR5Tug9W5e9D+lAhgsMQiGQZwTJtuehdjPWyEV
	aHVvvzW4oBj1rcNVWC+2KaB6jk+S/HeV4ddiR7jcnSlg5LUcHqD2
X-Gm-Gg: ASbGncsa0ItEtBnn0GPWwmQA6/2EJv3dWTVeakBs+mw8kDb7ZbZU1zPFG6D8Ppz9S93
	SEtImQJt/aaKJToHc66BhavvYxDXvdNxk33G5HStmkGuYL3GSNjr1Cr1AVv8kGBDUbmxAFUoc4Z
	h+ePHDnNhpaqOK5xD/4n+Hqd5ohyKp8hPgXJivhTRETQwpOMFg11VAk0nSF8Pjy91H+vqZcweXi
	hnHozH+OGwOlgRX/gHsNLwpBxhlNSourVDHSqGyjo7jzylRYmVE3zGlEc0AQvfTsXQ3HVKkVGeg
	aLLBvc5D1nl1FbtAvF3P8dxefpYgsg==
X-Google-Smtp-Source: AGHT+IEe3pc2lVsVkhnqLCSlyDpewTkSJC79/CsviL5DkUxD+u6OxER0DZOVHU5iwPxiRLJwA2Z93A==
X-Received: by 2002:a05:6402:40cf:b0:5d3:ba42:e9fa with SMTP id 4fb4d7f45d1cf-5d63c3405a8mr33138305a12.16.1734422571994;
        Tue, 17 Dec 2024 00:02:51 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae12a7sm3990967a12.50.2024.12.17.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:02:51 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 17 Dec 2024 09:02:49 +0100
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Uros Bizjak <ubizjak@gmail.com>,
	Laura Nao <laura.nao@collabora.com>, bpf@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@collabora.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	"dwarves@vger.kernel.org" <dwarves@vger.kernel.org>
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
Message-ID: <Z2EwKSgh0cA2EHun@krava>
References: <20241115171712.427535-1-laura.nao@collabora.com>
 <20241204155305.444280-1-laura.nao@collabora.com>
 <CAFULd4a+GjfN5EgPM-utJNfwo5vQ9Sq+uqXJ62eP9ed7bBJ50w@mail.gmail.com>
 <Z10MkXtzyY9RDqSp@pop-os.localdomain>
 <3be0346a-8bc9-4be1-8418-b26c7aa4a862@oracle.com>
 <c067bc3d-62d6-4677-9daf-17c57f007e67@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c067bc3d-62d6-4677-9daf-17c57f007e67@oracle.com>

On Mon, Dec 16, 2024 at 03:19:01PM +0000, Alan Maguire wrote:
> On 14/12/2024 12:15, Alan Maguire wrote:
> > On 14/12/2024 04:41, Cong Wang wrote:
> >> On Thu, Dec 05, 2024 at 08:36:33AM +0100, Uros Bizjak wrote:
> >>> On Wed, Dec 4, 2024 at 4:52 PM Laura Nao <laura.nao@collabora.com> wrote:
> >>>>
> >>>> On 11/15/24 18:17, Laura Nao wrote:
> >>>>> I managed to reproduce the issue locally and I've uploaded the vmlinux[1]
> >>>>> (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of the
> >>>>> modules[3] and its btf data[4] extracted with:
> >>>>>
> >>>>> bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd_led_backlight.ko.raw
> >>>>>
> >>>>> Looking again at the logs[5], I've noticed the following is reported:
> >>>>>
> >>>>> [    0.415885] BPF:    type_id=115803 offset=177920 size=1152
> >>>>> [    0.416029] BPF:
> >>>>> [    0.416083] BPF: Invalid offset
> >>>>> [    0.416165] BPF:
> >>>>>
> >>>>> There are two different definitions of rcu_data in '.data..percpu', one
> >>>>> is a struct and the other is an integer:
> >>>>>
> >>>>> type_id=115801 offset=177920 size=1152 (VAR 'rcu_data')
> >>>>> type_id=115803 offset=177920 size=1152 (VAR 'rcu_data')
> >>>>>
> >>>>> [115801] VAR 'rcu_data' type_id=115572, linkage=static
> >>>>> [115803] VAR 'rcu_data' type_id=1, linkage=static
> >>>>>
> >>>>> [115572] STRUCT 'rcu_data' size=1152 vlen=69
> >>>>> [1] INT 'long unsigned int' size=8 bits_offset=0 nr_bits=64 encoding=(none)
> >>>>>
> >>>>> I assume that's not expected, correct?
> >>>>>
> >>>>> I'll dig a bit deeper and report back if I can find anything else.
> >>>>
> >>>> I ran a bisection, and it appears the culprit commit is:
> >>>> https://lore.kernel.org/all/20241021080856.48746-2-ubizjak@gmail.com/
> >>>>
> >>>> Hi Uros, do you have any suggestions or insights on resolving this issue?
> >>>
> >>> There is a stray ";" at the end of the #define, perhaps this makes a difference:
> >>>
> >>> +#define PERCPU_PTR(__p) \
> >>> + (typeof(*(__p)) __force __kernel *)(__p);
> >>> +
> >>>
> >>> and SHIFT_PERCPU_PTR macro now expands to:
> >>>
> >>> RELOC_HIDE((typeof(*(p)) __force __kernel *)(p);, (offset))
> >>>
> >>> A follow-up patch in the series changes PERCPU_PTR macro to:
> >>>
> >>> #define PERCPU_PTR(__p) \
> >>> ({ \
> >>> unsigned long __pcpu_ptr = (__force unsigned long)(__p); \
> >>> (typeof(*(__p)) __force __kernel *)(__pcpu_ptr); \
> >>> })
> >>>
> >>> so this should again correctly cast the value.
> >>
> >> Hm, I saw a similar bug but with pahole 1.28. My kernel complains about
> >> BTF invalid offset:
> >>
> >> [    7.785788] BPF: 	 type_id=2394 offset=0 size=1
> >> [    7.786411] BPF:
> >> [    7.786703] BPF: Invalid offset
> >> [    7.787119] BPF:
> >>
> >> Dumping the vmlinux (there is no module invovled), I saw it is related to
> >> percpu pointer too:
> >>
> >> [2394] VAR '__pcpu_unique_cpu_hw_events' type_id=2, linkage=global
> >> ...
> >> [163643] DATASEC '.data..percpu' size=2123280 vlen=808
> >>         type_id=2393 offset=0 size=1 (VAR '__pcpu_scope_cpu_hw_events')
> >>         type_id=2394 offset=0 size=1 (VAR '__pcpu_unique_cpu_hw_events')
> >> ...
> >>
> >> I compiled and installed the latest pahole from its git repo:
> >>
> >> $ pahole --version
> >> v1.28
> >>
> >> Thanks.
> > 
> > Thanks for the report! Looking at percpu-defs.h it looks like the
> > existence of such variables requires either
> > 
> > #if defined(ARCH_NEEDS_WEAK_PER_CPU) ||
> > defined(CONFIG_DEBUG_FORCE_WEAK_PER_CPU)
> > 
> > ...
> > 
> > #define DEFINE_PER_CPU_SECTION(type, name, sec)                         \
> >         __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;                    \
> >         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
> >         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
> >         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
> >         __PCPU_ATTRS(sec) __weak __typeof__(type) name
> > 
> > 
> > I'm guessing your .config has CONFIG_DEBUG_FORCE_WEAK_PER_CPU, or are
> > you building on s390/alpha?
> > 
> > I've reproduced this on bpf-next with CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y,
> > pahole v1.28 and gcc-12; I see ~900 __pcpu_ variables and get the same
> > BTF errors since multipe __pcpu_ vars share the offset 0.
> > 
> > A simple workaround in dwarves - and I verified this resolved the issue
> > for me - would be
> > 
> > diff --git a/btf_encoder.c b/btf_encoder.c
> > index 3754884..4a1799a 100644
> > --- a/btf_encoder.c
> > +++ b/btf_encoder.c
> > @@ -2174,7 +2174,8 @@ static bool filter_variable_name(const char *name)
> >                 X("__UNIQUE_ID"),
> >                 X("__tpstrtab_"),
> >                 X("__exitcall_"),
> > -               X("__func_stack_frame_non_standard_")
> > +               X("__func_stack_frame_non_standard_"),
> > +               X("__pcpu_")
> >                 #undef X
> >         };
> >         int i;
> > 
> > ...but I'd like us to understand further why variables which were
> > supposed to be in a .discard section end up being encoded as there may
> > be other problems lurking here aside from this one. More soon hopefully...
> >
> 
> 
> A bit more context here - variable encoding takes the address of the
> variable from DWARF to locate the associated ELF section. Because we
> insist on having a variable specification - with a location - this
> usually works fine. However the problem is that because these dummy
> __pcpu_ variables specify a .discard section, their addresses are 0, so
> we get for example:
> 
>  <1><1e535>: Abbrev Number: 114 (DW_TAG_variable)
>     <1e536>   DW_AT_name        : (indirect string, offset: 0x5e97):
> __pcpu_unique_kstack_offset
>     <1e53a>   DW_AT_decl_file   : 1
>     <1e53b>   DW_AT_decl_line   : 823
>     <1e53d>   DW_AT_decl_column : 1
>     <1e53e>   DW_AT_type        : <0x57>
>     <1e542>   DW_AT_external    : 1
>     <1e542>   DW_AT_declaration : 1
>  <1><1e542>: Abbrev Number: 156 (DW_TAG_variable)
>     <1e544>   DW_AT_specification: <0x1e535>
>     <1e548>   DW_AT_location    : 9 byte block: 3 0 0 0 0 0 0 0 0
> (DW_OP_addr: 0)
> 
> 
> You can see the same thing for a simple program like this:
> 
> #include <stdio.h>
> 
> #define SEC(name) __attribute__((section(name)))
> 
> SEC("/DISCARD/") int d1;
> extern int d1;
> SEC("/DISCARD/") int d2;
> extern int d2;
> 
> int main(int argc, char *argv[])
> {
> 	return 0;
> }
> 
> 
> If you compile it with -g, the DWARF shows that d1 and d2 both have
> address 0:
> 
>  <1><72>: Abbrev Number: 5 (DW_TAG_variable)
>     <73>   DW_AT_name        : d1
>     <76>   DW_AT_decl_file   : 1
>     <77>   DW_AT_decl_line   : 5
>     <78>   DW_AT_decl_column : 22
>     <79>   DW_AT_type        : <0x57>
>     <7d>   DW_AT_external    : 1
>     <7d>   DW_AT_location    : 9 byte block: 3 0 0 0 0 0 0 0 0
> (DW_OP_addr: 0)
>  <1><87>: Abbrev Number: 5 (DW_TAG_variable)
>     <88>   DW_AT_name        : d2
>     <8b>   DW_AT_decl_file   : 1
>     <8c>   DW_AT_decl_line   : 7
>     <8d>   DW_AT_decl_column : 22
>     <8e>   DW_AT_type        : <0x57>
>     <92>   DW_AT_external    : 1
>     <92>   DW_AT_location    : 9 byte block: 3 0 0 0 0 0 0 0 0
> (DW_OP_addr: 0)
> 
> 
> So the reason this happens for dwarves v1.28 in particular is - as I
> understand it - we moved away from recording ELF section information for
> each variable and matching that with DWARF info, instead relying on the
> address to locate the associated ELF section. In cases like the above
> the address information unfortunately leads us astray.
> 
> Seems like there's a few approaches we can take in fixing this:
> 
> 1. designate "__pcpu_" prefix as a variable prefix to filter out. This
> resolves the immediate problem but is too narrowly focused IMO and we
> may end up playing whack-a-mole with other dummy variable prefixes.
> 2. resurrect ELF section variable information fully; i.e. record a list
> of variables per ELF section (or at least per ELF section we care
> about). If variable is not on the list for the ELF section, do not
> encode it.
> 3. midway between the two; for the 0 address case specifically, verify
> that the variable name really _is_ in the associated ELF section. No
> need to create a local ELF table variable representation, we could just
> walk the table in the case of the 0 addresses.
> 
> Diff for approach 3 is as follows
> 
> diff --git a/btf_encoder.c b/btf_encoder.c
> index 3754884..21a0ab6 100644
> --- a/btf_encoder.c
> +++ b/btf_encoder.c
> @@ -2189,6 +2189,26 @@ static bool filter_variable_name(const char *name)
>         return false;
>  }
> 
> +bool variable_in_sec(struct btf_encoder *encoder, const char *name,
> size_t shndx)
> +{
> +       uint32_t sym_sec_idx;
> +       uint32_t core_id;
> +       GElf_Sym sym;
> +
> +       elf_symtab__for_each_symbol_index(encoder->symtab, core_id, sym,
> sym_sec_idx) {
> +               const char *sym_name;
> +
> +               if (sym_sec_idx != shndx || elf_sym__type(&sym) !=
> STT_OBJECT)
> +                       continue;
> +               sym_name = elf_sym__name(&sym, encoder->symtab);
> +               if (!sym_name)
> +                       continue;
> +               if (strcmp(name, sym_name) == 0)
> +                       return true;
> +       }
> +       return false;
> +}
> +
>  static int btf_encoder__encode_cu_variables(struct btf_encoder *encoder)
>  {
>         struct cu *cu = encoder->cu;
> @@ -2258,6 +2278,11 @@ static int
> btf_encoder__encode_cu_variables(struct btf_encoder *encoder)
>                 if (filter_variable_name(name))
>                         continue;
> 
> +               /* A 0 address may be in a .discard section; ensure the
> +                * variable really is in this section by checking ELF
> symtab.
> +                */
> +               if (addr == 0 && !variable_in_sec(encoder, name, shndx))
> +                       continue;
>                 /* Check for invalid BTF names */
>                 if (!btf_name_valid(name)) {
>                         dump_invalid_symbol("Found invalid variable name
> when encoding btf",
> 
> 
> ...so slightly more complex than option 1, but a bit more general in its
> applicability to .discard section variables.
> 
> For the pahole folks, what do we think? Which option (or indeed other
> ones I haven't thought of) makes sense for a fix for this? Thanks!

I can reproduce this with the CONFIG_DEBUG_FORCE_WEAK_PER_CPU enable,
the fix looks fine, could you send formal patch?

thanks,
jirka
