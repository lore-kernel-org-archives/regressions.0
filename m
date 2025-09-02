Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6732EA49F
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804192; cv=none; b=Apn+NS1lEfYlwael59xR7th1WzJFO7hrX9QtmNjQjwZeLhdobsibRxgZaTiuzN0nm+iBoEZBG+eIjycBUj0coloSbS6u33ynFZRGzwaxlW4/gT8HXfWGyBhu8Xd5ydMvi+yNzvzEgcPmohuHad4mvLHgq2/Yu1EfpPr4891/Cnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804192; c=relaxed/simple;
	bh=A8eyEfj3BP3VmKLPbiefQOv3kForpLTfoyzNz1iTBI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b9Q6JhzQD1qZ43fcw+bEPrM8lvwEVxi7JekyAc1w7ZFrnmVJBKI9HyoTxtUyiGKdzNtygZhDCWIqmJ4yn3bepoLpI8rgIPZFJ+QjeyqEWdzxkWSDc5d+PN2mWsbgARszKnVqFcjKWOAay6yYTajzqd3nsrrAgFroYBwGT7s+nsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FegpyobY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FegpyobY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3dae49b1293so202219f8f.1
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756804189; x=1757408989; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bw74ZDWYln3R5EhzIwK/dVcSfr5R7Z8FO22rXgIrEXw=;
        b=FegpyobY53lG0uqeGAW9qpMqnOZUt+TlosbHy9SY2wcJiRb1GzPVBl6kAmjQfAsRjI
         4bwIyg+8mL+VyRVQ8VdZENAALzerzHbgET4QakAxyMWumGaBwPziyJgvkidqMME0gm35
         MAkrpvnoPHTbTGkbzGfSYfYZP9/C8h/HR6pRF48Dfm2CzfPYYYu4ZHEjkeOK5QfO3HwF
         sxojkDQXdkAZf+QcmImMmIdw0wjFm5xZ4QbZ3wEODC53wDJJRYbB0sNAMt5o6BXpGvgb
         oOIzVca2bRgSU9BDlGz0qpGcVb38OHQ4nfI1yKqaP7V/pGl4+ldJdl9vEZ3zUhiv+KJe
         VELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804189; x=1757408989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bw74ZDWYln3R5EhzIwK/dVcSfr5R7Z8FO22rXgIrEXw=;
        b=qDuoPUiGkokjo1RyxgvFguqPBL8pA0DbzuhXlA0EA2WUbgy9txoTY1ggJsnEAYC5PP
         ZrgvhDk60r2arLlVqHmbAaS7ospK2qcpxO4dWkudh72ovhMcUaYaGF/CVmgeuaE92HPX
         1ycsG6VKrh7Gh8RZk+uGOIDWSgRtkZvfGrJXp8kriIJ9kV0ee78rKeej+KroZ1s8PfS7
         63+cSLBg49wT7oiT07p6l5GtakqUYKyNs2Z8UNQpRw7tA+qGpUMgakg/tnfohRtLxnPm
         Pqg2QHHmR/+RT5f3gz69RZklimlGejd+n+vpqzhybVfxfAdro2/bYjQ0qP7NQwJxdG9N
         5neA==
X-Forwarded-Encrypted: i=1; AJvYcCUOoOp+SFXfA7/TMm9Xck5+zgmTuaBkZa8/hBHRfMC8JDA6CFiesS1CGLGx8gUMfkl/feqHQ/uMEgY9gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCXyQ8QkH8mXGcV6nCsYKMS/LaLOdM/pGNuHf+hPK/EauIXJ46
	SG/4KD0cBvt6+1LIZOcIDavNkkPn4lPmWiJ6rMi1RULWvF61SXYQyLHM0ge32Lqh
X-Gm-Gg: ASbGnctPEEyF6NFLTbAyKKpCrhhfx5SGEhI/E8qoDO01h+Dimlq1OFbmfZe4+AQiApP
	bn3nN6x321wEESRRcNuUo/RfAEhKY29BVXhDgMhQZrZnIUgoeHyoytHeEMgd4xe5JqXD+O/wuPe
	CnUlDL2hGN3QXKd/T3i++k5DfevTuQfPSHG1pL1kLjmMmaIr2sr15elFDbvytNfkJFGUCoelYlx
	xAWuZCgw2+plSJVR2xpsIzqldSr9JPps0Jhkm5eHxB8HQQZT5D0akVufmZraQFoOCWB+lRCTIZl
	dnujz3Vxxp2WkFQj7tz5WM6DcZq503+XdbZ4OBPut/MlSaYRltAmrN8K0nK/237TvHI2BPH/RvL
	fFWCUcz60SpkFYB9MzPLlQFi0C7eK75oTqcok+sNiNJUp09wWdJuDeWUr3//VdclH9mr2LQ==
X-Google-Smtp-Source: AGHT+IHNGi1WlUp37oda1jCD0mIQM+pwLYeo9d0bEci6H/DuqNOy5AfU0gRE95Kv3q/RMJ5wltAJRg==
X-Received: by 2002:a05:6000:2586:b0:3cd:c10d:3b6b with SMTP id ffacd0b85a97d-3d1de4b9891mr7783573f8f.27.1756804188869;
        Tue, 02 Sep 2025 02:09:48 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:3f02:d36b:e22e:74c6? ([2a02:168:6806:0:3f02:d36b:e22e:74c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33add294sm20017536f8f.29.2025.09.02.02.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:09:48 -0700 (PDT)
Message-ID: <1cc6781ea584aa00a8cda23db1fc8cd59f852a3d.camel@gmail.com>
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jan Palus <jpalus@fastmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, 	regressions@lists.linux.dev
Date: Tue, 02 Sep 2025 11:09:47 +0200
In-Reply-To: <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
References: <bug-220479-41252@https.bugzilla.kernel.org/>
	 <20250820184603.GA633069@bhelgaas>
	 <42rznc7krv3gdwmdzfz6o5nalnzleiwfg44yleqjet67cu4ijm@pwap3ph2n2u7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-08-21 at 02:45 +0200, Jan Palus wrote:
>=20
> Relevant fragment of mvebu_get_tgt_attr() in mentioned commit:
>=20
> +		u32 slot =3D upper_32_bits(range.bus_addr);
> =C2=A0
> -		if (DT_FLAGS_TO_TYPE(flags) =3D=3D DT_TYPE_IO)
> +		if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
> =C2=A0			rtype =3D IORESOURCE_IO;
> -		else if (DT_FLAGS_TO_TYPE(flags) =3D=3D DT_TYPE_MEM32)
> +		else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32)
> =C2=A0			rtype =3D IORESOURCE_MEM;
> =C2=A0		else
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
>=20

As far as I understand the situation, of_pci_range_parser_one() inherently =
uses bus->get_flags()
aka of_bus_pci_get_flags() to determine range.flags (see drivers/of/address=
.c).

And of_bus_pci_get_flags() does essentially the same thing as the code abov=
e in mvebu_get_tgt_attr().
So, now the translation logic is applied twice - which probably was not int=
ended.

To restore the original behaviour, I think the determination of rtype from =
range.flags must be=C2=A0
completely removed, and rtype must be replaced by range.flags.

Something like this on top of mainline - completely untested, but maybe wor=
th a try.

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pc=
i-mvebu.c
index 755651f338..3fce4a2b63 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1168,9 +1168,6 @@ static void __iomem *mvebu_pcie_map_registers(struct =
platform_device *pdev,
        return devm_ioremap_resource(&pdev->dev, &port->regs);
 }
=20
-#define DT_FLAGS_TO_TYPE(flags)       (((flags) >> 24) & 0x03)
-#define    DT_TYPE_IO                 0x1
-#define    DT_TYPE_MEM32              0x2
 #define DT_CPUADDR_TO_TARGET(cpuaddr) (((cpuaddr) >> 56) & 0xFF)
 #define DT_CPUADDR_TO_ATTR(cpuaddr)   (((cpuaddr) >> 48) & 0xFF)
=20
@@ -1189,17 +1186,9 @@ static int mvebu_get_tgt_attr(struct device_node *np=
, int devfn,
                return -EINVAL;
=20
        for_each_of_range(&parser, &range) {
-               unsigned long rtype;
                u32 slot =3D upper_32_bits(range.bus_addr);
=20
-               if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_IO)
-                       rtype =3D IORESOURCE_IO;
-               else if (DT_FLAGS_TO_TYPE(range.flags) =3D=3D DT_TYPE_MEM32=
)
-                       rtype =3D IORESOURCE_MEM;
-               else
-                       continue;
-
-               if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D rtype) {
+               if (slot =3D=3D PCI_SLOT(devfn) && type =3D=3D range.flags)=
 {
                        *tgt =3D DT_CPUADDR_TO_TARGET(range.cpu_addr);
                        *attr =3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
                        return 0;


