Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED9360EE4
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785537769; cv=pass; b=W2FVRU1mWM8jTbqTFgoeU+Un/f+hjP31ynrpDyPo8WNRBqR7TPr/Mdz0fRiIGSUE9nkfN9aMFByMvSUdkPVdOvroWeEDZEf2aMC7YZ5WDF2zMWAJbmxyulkysCCVnvsz81oIokdT0azOXnJmRR+qnzqEryQFCHtgyaLj4zQZC70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785537769; c=relaxed/simple;
	bh=cegOLujbI2LfUSz6SuewyzDp7MAuSuCLdFkmWG1zMrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pqhhc+dSSNoI7cT6JPrPa1xrQUfoFcVzFW25i/7ncDJdTlWCT3S23wtsW0afV0dUfAAAuYEBIIj0fiDdZlBKAqwxDIzjuUpxfPpwU/5WSABfJRcnxYu1JklZ8pEcIc39T5aJeI6YPqEg1S2id9Lh5or987RoElut9AgCbh2ATXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5IgD5JA; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5IgD5JA"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so13019791fa.0
        for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 15:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785537766; cv=none;
        d=google.com; s=arc-20260327;
        b=Boolsy7lKRZ6WjdR9ulLv8uxzGYETn7oj/obyfsQhZVcKI+gDrMXGwFdMgJvmGkiEQ
         X4ob11+PdVfLqnVjMbnUQC8BXZ1GWjWEcAQ7ZY3yP7C+j1AOdRo9NhN+qTdMH8E74qiC
         0x1IHs2UV6Di1vxJp5hracUMKeA6h5WVc3N3hrco77k2dG8PjgKecZDOyhaoCnArbTcQ
         Lvuy1QhWkhqRo5jGO05kmCgSi7HT0qqcu6n84Vfp4QjoTRMENdOFk1b92OCAfnBawPi0
         SvFwqfn9hGQf7HmaXoEt4hIsGchJ4MexuHP59eQTdu9Dqwp7MwnyT9a2H77RUIIOu11i
         Tbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=NwrtRUyNKFktqAHy/3WHzCYE4wzBTYRSuF4qoDAGW8c=;
        fh=Vm79Dy/aRjQkWqXYxb/nBvKj6GrHCM5HGMI8W3/bUHQ=;
        b=RkkQg7E+EuwKeEH12bGi13VRhyBjSb347Q0W6eC0K1UArq/EMGPPZ4R+o/5QnzqEkm
         p7smp9hXmTYZW282dyPDkPwl48zC/J9+XDp2XYtpxxQeBgvMc3aLtafIvA3qc5tN5Ra/
         iFSefpKideSSWoQm6F9UjM43zX8QI6HAXwlH7D1us5yb9EuBpAhCkBsrRVu2JWC97dCV
         H8dTqLjrxys3PuPi5xIkOgE3EtSaerkavB6+5cDBjS4N7MD/Ms7bsH8oXhU2JFl7flqC
         whS56SpWDQhySimyaXTGac3LpSED2NMI9q8EAh7t8BXQ95K61Lb+xBP0jpiPVbHkLFzX
         mReg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785537766; x=1786142566; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NwrtRUyNKFktqAHy/3WHzCYE4wzBTYRSuF4qoDAGW8c=;
        b=C5IgD5JA9nhTvtd99AMLqCxHLOUP3PqH7ld1jb4NH+0xuYiafIfrIsHcAIBpLrK+f7
         MmSyuuWXFuTN7s8iuYkusQHy8qlbvaCgdExswL12uzhU12iSxYPkc1G1FwnMYP61C86C
         F5fZACMvr6puAWIVskeIjvATFyn24qhOK01P9TN7JjXppcAGrsAOq15/r5RybPvO1KTV
         FC9DZ0bNtyy71VR5th8bsX/lzFNqSTQPBzzn4mCx77DCu1vBcaf/XuQZGCiM/q/nMiLe
         cYLIfetPA7YhPvR5SbLm17Q35rYDuXWf+VCffIpUFvoGC60o2poLlDVCDtlUlzZ6Cesg
         Ej/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785537766; x=1786142566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwrtRUyNKFktqAHy/3WHzCYE4wzBTYRSuF4qoDAGW8c=;
        b=X/xZdGyAc9TA4zCNLsCejorHXeev6rrxiW/4gcqnFj3hT+hECZ1KRc5IUg7/asL2Dx
         cvh03TnhgyA4OHunpDpP9KOC7tGz7tgq//3CBpCsZb8NH8NcBNZ0SmIpjJLMvli06AKX
         HrAHUepMO/PaV0q68BmZ8ECQbqoFh+xGYu59DwqTnm5m55WWhSt1tzny8pijXuLXG8Ja
         EM8qG+rypeIvwykx+SSF+TB3cwmx0qX9tPQSo/jAHUXZEisbufIMhE93+qkHctS+OSQO
         fBGYTOqQGUVuAXjZ5EZKQQd1d5mBA7Qn60kNVY5mUsj+Z3GfE9OB5/7FcZHzAYgOzWuk
         9IoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUu2tEaQ6bCN9vFyMpKJTjlgGwHt4yWFGrLB8AxBf7qfjvraPEWsUitI79a2StR+SPIS3iPN9HhBBJog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9+fshmRjRL+00HBN2PNzsNjZ6U6bZJTIWlXfmH+qqJexgAKaN
	Zq2aRQc4I+NhekwISIfacbiAmoQezFxEZXufpydLM0UmNmxD2s6Az8nDE7fJgaPm66LLq5wil5B
	evMMY/got4qPTKGgPgT4f6txecvgnyFM=
X-Gm-Gg: AR+sD13RiVfzVuHjnQnSnfhGp1tIxEt6IX8nAMQUvqS+yQEg120z4FlOwNV+Z+fsOrI
	vyxM8y2PeXIAeVJHjR/F/cGIuQpKpLBx13G/E9bQyniWNhRn5EZfGQrkE1D/N1QiXix3Yjd0FBh
	AXlg7d2LuspoOAsBOcUKRbv8TdHuSxcv2BlbTJO6Ut4p6FJgAGaMyT46FgNB5f5sgrhKuY9+vMz
	BIacdD3cEieloUR6p7xLvTfBxG4V5w/l36TAvLlR1fGWHd0rHx292OM+oHg/W272ulRfWD3/PlL
	64Mi/MLshz4pcqOaiBz5XUmPyhKAdn2SJOI8viD2sglj/rzLZ0pw+eSGc1gceSMbXv6aN4W0meD
	bp62F6mXnq8ElokrKHx61221q+Ls6oF6LdHIsAUnluntq4dIx3DjN
X-Received: by 2002:a05:651c:c8d:b0:39c:74ef:1a86 with SMTP id
 38308e7fff4ca-39f8640cf26mr2452871fa.33.1785537765380; Fri, 31 Jul 2026
 15:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260712-pci-rebar-root-bus-v2-1-a1b9107a82dc@honeycomb.io>
 <20260731162424.GA1571989@bhelgaas> <CAC0H+B-p5MT4M03MMkbxr_dLjsuThkxPv3--Ciant0i2MvvqDw@mail.gmail.com>
In-Reply-To: <CAC0H+B-p5MT4M03MMkbxr_dLjsuThkxPv3--Ciant0i2MvvqDw@mail.gmail.com>
Reply-To: bjorn@helgaas.com
From: Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date: Fri, 31 Jul 2026 17:42:32 -0500
X-Gm-Features: AUfX_mzkvLUGzJCYHgtRvb9G-SIli9XZ_yCQ5x2jz8b5Ly_BQwxe_F38zuwne_c
Message-ID: <CABhMZUX+8tjN1Hz=tf6bm+K7BV4r=1RxctiN6W_UPz9+yxG+Qg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Fix BAR resize for devices on a root bus
To: Liz Fong-Jones <lizf@honeycomb.io>
Cc: Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, Jon Nettleton <jon@solid-run.com>, 
	Jon Nettleton <jon.nettleton@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Liz Fong-Jones <lizf@honeycomb.io> wrote:
>>> This breaks amdgpu completely on the SolidRun HoneyComb LX2 (NXP
>>> LX2160A, arm64, ACPI), where the GPU endpoint is enumerated directly
>>> on the root bus of its segment (there is no root port device, so
>>> pdev->bus->self is NULL):

On Fri, Jul 31, 2026 at 12:15=E2=80=AFPM Liz Fong-Jones <lizf@honeycomb.io>=
 wrote:
>> Maybe this is a tangent, but I'm curious about this topology.  Is this
>> running as a virtualized guest?  At the hardware level, a PCIe
>> endpoint must have a Root Port somewhere, even if it isn't visible to
>> the OS (as is often the case in virtualized guests).
>
> Defer to Jon on what the actual hardware configuration is, but this is
> physical hardware, no virtualisation, running as the UEFI rather than U-B=
oot
> (devicetree) variant. See:
> https://dev.solid-run.com/nxp/lx2160a/com-som/lx2160a-com-hardware-user-m=
anual#block-diagram

I guess this must be the drivers/pci/controller/mobiveil/pcie-layerscape-ge=
n4.c
driver.  The commit log mentioned this:

>>>   amdgpu 0004:01:00.0: BAR 0 [mem 0xa400000000-0xa40fffffff 64bit pref]=
: releasing

so the GPU is on bus 01, which isn't a nice round bus number like root buse=
s
usually are.  The typical thing would be a root port on bus 00 with a secon=
dary
bus 01, and amdgpu being on that bus 01.  Can you share a dmesg log?  It
should include the lx2160a host bridge details and the PCIe topology below =
it.
