Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF43156C6F
	for <regressions@lists.linux.dev>; Sat, 28 Dec 2024 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735398438; cv=pass; b=b6KGcN3LZvKBRaRFenj6HOUz1bTnsJxy1BW0b356DKoW7yviWOczTSAlheHziPL6graCraNWbKQUezQZOYNna4Jdran7GrmuhTom2TJDL8/c7lWRKvkIHtOYMLvX6bgsH6G3wgcDfPMZWBq1Fvncm6iYIG513GeiiUM0n0vw0nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735398438; c=relaxed/simple;
	bh=37VKn5PLSOeqkXzIPtEdx5FmaRPfL25988paX84Qwm4=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RMkX58aElUsIFcW46DWpWgybdEC9GGMWrjZE9DG2FoyYZooogEl7fpEuIrgklody+Lz6PYnOeJhS2lBTbUsfauZ6nUIU8qukAsfrfGaK4qXszYjv6A/mjNChAGsnbIrfxBrrjv2T3jwhYPCVyJN+siQNnQ+wZU/n+uom/aDE4HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=UN31UaZy; dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=uyOjos4P; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="UN31UaZy";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="uyOjos4P"
ARC-Seal: i=1; a=rsa-sha256; t=1735398248; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=k0uwYPQkHAo+8e10ZExX2OgkwOUEDmRCKDXAVyQbQRcxcuy0gmEK6MlQr9AVuiEfRV
    KdUqZTmQF+Ze6CsGc2zX7zuJtxQ4KTdukAhDnH78gRjwIGEIdIB4xJkw83j/IB5kjjPy
    CoTfP1HNeWU96KeZPyKufNMAH2ew383rPeKiL21M9X8KO/T6rHQK3se4cJMUbqA41zlV
    OgHlXp4wEW3l52MszVcdcxqRsI9XReEa7jTqGY1D4EBPpEvL33CLLTw3eOKGD/814j2V
    KQjHJHWRqnUQksWjmqjNs6YXclHyV9XbogQOb6Tyuw2+EmR2PQF+mKB6b2a/k3K4gnsa
    Ov+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=iMVebN6WQ904H83JEYgS30s/E7pL4dNL/G6/yI7vmG0KMU3e1eb37UzVergMygIO9A
    PYTba4s97ajifu5c+J6AjA3fW8lTZeZL5XEYX0Io6vt/Pkqq+ox54OYIZ/MBRJ9A4cIC
    kV1aD82wAVjmjkheV6iZS70F28DFyejbS3Yvd//ynrY56Qp6NsQpS4Yip4nvEtO1UJkg
    x78nF9k36a7svFNHtK8bu9+cMA+M7H1VsZZ087wB8gMT4wA5/AnMhuIJdrilk0n+43VB
    ppQTC9hJ4crDomZ3V7vpFEHv10JMmGN7hUl0JomfUjL2SwwHFFDSr0gaqsR2TXiMxRv1
    skVA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=UN31UaZy21+kxhhtDhwgkrhb6UtxXfskPWW/9daTjm+fhmoU3rJF9qaQU/WRlCClLu
    iqUtfCArxEyEbAXlFjobPtbBT+vTGbHGTWHQGiS20MLNBgVMf1yGVfIBgbiup5rqvwVO
    jyldTWFEyMbL1OqLp1eyK81fn4VichrwaYEoKLPnSL18nh9nCV7LuxDsFl7+AcZCrkji
    OFQE4RH0jprXd49VTs4uBybao1wxsPHtlMSYnPaIv86B0veCswNEwe32vuSrvLN8xaG7
    47griSASZgkAcXNvDa4mUD7NErUHXG4lO6j4UuvC/Gh9zsN/OWk2z5uJu6B5kHTIJ9WL
    5nEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=uyOjos4Pq9zzk9G4p64LWmL+PBVpNZn2d12XwMvg1I/3h9NSTw73WqY43spAeFumVQ
    /ALsIidT4PMm9gpGsQCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BSF47GYz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Dec 2024 16:04:07 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
 <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
 <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
 <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
 <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
Message-ID: <02c39ee9-7b54-8384-6ddc-b979abc9e7c9@xenosoft.de>
Date: Sat, 28 Dec 2024 16:04:07 +0100
X-Mailer: BrassMonkey/33.4.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

I found out which area is responsible for the KVM HV issue while 
reducing the revert patch.

If I replace the following line in the file 
'a/arch/powerpc/kvm/e500_mmu_host.c' then KVM HV works again.

-        pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+        pfn = gfn_to_pfn_memslot(slot, gfn);


On 28/12/24 15:55, Paolo Bonzini wrote:
 > The fix is already found, I will send it out shortly but everybody is on
 > vacation now

Thanks a lot! Could you please post the patch on this list? I would like 
to patch the RC5 of kernel 6.13 next week.

Thanks,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)

