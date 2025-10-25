Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD52FBE02
	for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761396253; cv=none; b=lBxG2tFBi0E4FnqpqxgzI649Pj960px3FXeWVYptjhqYqAx0/+UWKw5qTtiYO8CLtb4DTteR3bfTD0r5nEUvtcQUi7B6ivJpN1F6hPEvq871oOT6KiDpaTk1+LFzxTjYp3cZE8KmA4NdOekhQDg23w4vOIZoM2F2YtPLctCxHkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761396253; c=relaxed/simple;
	bh=uHwEWGWussA5vwUdmTXYqVWHoUC1FpOBR1zr7bgFbpA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jh0VQtIa+9ihjinyWmaEaMnvYbDLOTaAREO3oLgccG5l6ZI18gK5fhITLILsG+amQmBmpBMczGy/7NroysG8+wkYtE/MuiNpW/sZ77qyq1mN7wE11g+yQ44jqlWMKpXDN3WIUv1tqxCeCaLYbRLmsCduFsDD4MNYpxqepJEm4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzd4WHz/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzd4WHz/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso5534505e9.2
        for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761396249; x=1762001049; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HoSJRtaYL1tSrAroXfLuV9j/PINsSdOeSgQvYolSDJo=;
        b=dzd4WHz/EjIU6woOdZypT8N3FCRyj8yPCdkGroJvNjJDcnDbayoEg2HW2/tmZS+VFF
         KsYtWkeIwNz/5mPFqK9j7C5TSPDIpmXSoJF+3SawydZzLZK2mgCkojelDSsSkOQb866K
         tacOtHTHRsPhK0cn3ecpOCx1gWbLk9bu8z/boh6HNHtJg2WvLfbsG+nFOWLgGoLLqGrY
         klUeTyCTuJy22gbPcXssekU6CSHqBWIMsg29XqE1dEsN3AJjjjgF611Ak2pl0B+vtAvu
         7iW7ezNHe+L+QupviZaUYT9iLfzfNICAsA85BW+qiodrTlSEdUCJMmxOZJOZehrdrc4d
         YgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761396249; x=1762001049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoSJRtaYL1tSrAroXfLuV9j/PINsSdOeSgQvYolSDJo=;
        b=CA6WQshuIu4SZD5KIXJepztYcSPqqMp4hDVeye9wAdeoinvGUYpoJqjxzTEBM4UZG0
         Asa1rOb7iowf6Rzf16tN18WG4RBKBVuziilV5Y+IgLSx7xn/GlPlxqhQxG1Qk4QCV5aW
         o9OgtpjSOQXH4hPtTjzQubcgDKdZuhiIoUVlURCntERzQxCGpUmMKCqGdOLPVmRXe5Ae
         rFtwPEQNZjvbZiNsCquwdRpn1GmxZyRjKs/XU5GjSp3ZVrUYBJyPJo68MaUYMydfkdaH
         hv842e90hkMwB5EkldTXIbG9q5+ASswE3O/rFrNSChSbp/qDtseyGzJz4cI4jRzE++LA
         XYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvLHFQF9a4fltV6W6yPE1TbApCN/fHC+Fi08DdkGL+9Hp7nzgR2CT5DFZsCRFTYYyrINlPAuJ48N0JGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQvNw4HWWWCsyNKMowu/lArM6mGdiMytpZUJ/OM8BZTL+9PvBb
	XLwiCPxn83pr5nbUdnkw9OSfN7/k4NeipJUF3jw7eqFFz8bZTqsxWbhF
X-Gm-Gg: ASbGncvi31W5+yKd6bc4cIqdcEQML8sqgmUmv2OnmX0ophqga3Ncg29n2qCdQCH8hMH
	RaufW8wwIyG3KB4PAMDLswDmnV9M4uEgkABAHp51s7+QoVxRIKL9Zz3g2slrd3pyK+ZDap7yEQb
	Ff6YqeVCsX+iKLh+YoLxT08+d1vf/GUMJ/mieKJYg0bMYs3d1Qs64lXqNo/WDbbVyNuXbdrWXpZ
	k2ydddTGs/+epCcs3n4u2pxKPGduFg8rJokmMEkzvnlhmwjMJj0+lJ2efxu72SrLkSsI5ggDF6F
	n351rye9sGJER267Dsw1RvTGrG9Kd0kaZnVW8A3OCBB1rlV6cZYL7B6JtUzpOAFIHM4cSygRe3Z
	McuDkyNIli/EP8OCFv4kgh3Ip6x9fthOs2h2y+BKB8hvhqAJwurmnoAZ2FmxtpIZh4fwUx94V3z
	H2CyFy52523mDbu7N6EskrZecXYOdivfODZkzImGgPc3azJCA=
X-Google-Smtp-Source: AGHT+IGE/ePaRlpeqp31jgCbwX547WUuKY96Od/s+DN2HDRytz5H58spbiUrGnbS+FBuiBiLsfE3sQ==
X-Received: by 2002:a05:600c:811b:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-4711787dcfbmr221625375e9.14.1761396249181;
        Sat, 25 Oct 2025 05:44:09 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:c4ec:4cfd:1e64:7a3f? ([2a02:168:6806:0:c4ec:4cfd:1e64:7a3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd478202sm33465995e9.14.2025.10.25.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:44:08 -0700 (PDT)
Message-ID: <af6f0f2e1dec9053c6984139b8582fc6ceab6813.camel@gmail.com>
Subject: Re: WARNING at drivers/pci/setup-bus.c:2373, bisected to "PCI: Use
 pbus_select_window_for_type() during mem window sizing"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Date: Sat, 25 Oct 2025 14:44:08 +0200
In-Reply-To: <990fe39da66ad23df4c85ef247b274a0fc6c2336.camel@gmail.com>
References: <20250829131113.36754-1-ilpo.jarvinen@linux.intel.com>
			 <20250829131113.36754-20-ilpo.jarvinen@linux.intel.com>
		 <51e8cf1c62b8318882257d6b5a9de7fdaaecc343.camel@gmail.com>
	 <990fe39da66ad23df4c85ef247b274a0fc6c2336.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-10-25 at 12:11 +0200, Klaus Kudielka wrote:
>=20
> > [=C2=A0=C2=A0=C2=A0 0.027107] pci 0000:00:03.0: bridge window [mem 0x00=
200000-0x003fffff] to [bus 02] add_size 200000 add_align 200000
> > [=C2=A0=C2=A0=C2=A0 0.027115] pci 0000:00:03.0: bridge window [mem 0x00=
200000-0x003fffff] to [bus 02] add_size 200000 add_align 200000
>=20
> So, this part of=C2=A0 pbus_size_mem() now seems to be called *TWICE* for=
 the same bridge window:
>=20
> 		add_to_list(realloc_head, bus->self, b_res, size1-size0, add_align);
> 		pci_info(bus->self, "bridge window %pR to %pR add_size %llx add_align %=
llx\n",
> 			=C2=A0=C2=A0 b_res, &bus->busn_res,
> 			=C2=A0=C2=A0 (unsigned long long) (size1 - size0),
> 			=C2=A0=C2=A0 (unsigned long long) add_align);
>=20
>=20
>=20
> WITHOUT the offending commit, I see only one line, and no WARNING.
> > [=C2=A0=C2=A0=C2=A0 0.027405] pci 0000:00:03.0: bridge window [mem 0x00=
200000-0x003fffff] to [bus 02] add_size 200000 add_align 200000
>=20
>=20


After some more testing, I think I know what is going on.

- My device seems to have only non-prefetchable IO resources.
- In pci_bus_size_bridges(), pbus_size_mem() is called twice, once with IOR=
ESOURCE_PREFETCH, once without.
- This seems to be the intended behaviour (with or without the offending co=
mmit).

- What DOES make the difference, is the use of pbus_select_window_for_type(=
) inside pbus_size_mem().
- On my device, that function returns the ***non-prefetchable*** resource, =
even if being asked for a prefetchable one.
- End result: b_res is valid (and identical) in both calls to pbus_size_mem=
().
- Honestly, that does not look right to me.


Indeed, my device goes back to the original behaviour (without WARNING), if=
 I go back to the original use of
find_bus_resource_of_type():


--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1312,7 +1312,9 @@ static void pbus_size_mem(struct pci_bus *bus, unsign=
ed long type,
        resource_size_t min_align, win_align, align, size, size0, size1 =3D=
 0;
        resource_size_t aligns[28]; /* Alignments from 1MB to 128TB */
        int order, max_order;
-       struct resource *b_res =3D pbus_select_window_for_type(bus, type);
+       struct resource *b_res =3D find_bus_resource_of_type(bus,
+                       IORESOURCE_MEM | IORESOURCE_PREFETCH | IORESOURCE_M=
EM_64,
+                       type);
        resource_size_t children_add_size =3D 0;
        resource_size_t children_add_align =3D 0;
        resource_size_t add_align =3D 0;



Comments?
