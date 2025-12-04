Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4C923EABD;
	Thu,  4 Dec 2025 14:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859501; cv=none; b=NMDMmMD32zwKX7iAukcRfOOm909K3dGWLncQD+F3ULXP9VZwGi+dtlaRzrut9Af7A0QXP/wm4zWayG+2a9JzwGaxFzRB4V5VFtIg4PKcHixQxE53S/uEgnbcxqH+PqP8DjiueyfUwpjFcH7r/d8qJ0GHdrOYGDp+TjgL6mUbw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859501; c=relaxed/simple;
	bh=BZEUPbQh8vHGgGUpk/lznqtideTsMIdugh5uEjpNAIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjZvC/u4rxZVIHbafEAYLWRG+pVgwRY2rZOmsxPclWZ6UAcZeT9nlzJ6oROkeOjWigfC3T66Gpvt4jHAkrkYfz6c2Cliwt9Ql0XlSnUGheUJ1G9mY49iphL2qd+4Nr2Xt/KrHnT7UbOmMPfrkpRYSNsm9kwdgT6OQ26oBRtrMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=tE7JZB0x; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="tE7JZB0x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=WsDtMRP6iyLXex45E7C5K6DghytfCjr+yYUzlpKqZ6s=; t=1764859499;
	x=1765291499; b=tE7JZB0xFHNp+SpqaujxV0pRU2ERyjtBQmV/yyVV068GvDKlSzxYzy3xmEBbT
	kZCqZ8lO9CTL7BIj3bdgpZDhm++dNGMFqi5vexVRsrsfGeLahMr9y3QGw/Ns3y0+QKj9lC5to35rz
	EcUcNnNRUzU6h1skp7VzIY6CAY+8/Mdq7mSMrMlhYrB2YHZ51ZiKL0bK2HvY4fS9w+sDgcQQ4izBb
	sYVOvfS0v7GeRM066OrEZMYFxYoQIcxmlpAtaLDw+jURI/rcaz+1LJpAy+TB52CCtpCzHslcOBlHY
	L4ZfwWGIQpbZ/4zWzAvOUjidwIxG19WeEk6IXvCE3Xv9Dg9z9Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vRAZk-009Fkr-0b;
	Thu, 04 Dec 2025 15:44:56 +0100
Message-ID: <f0595a07-c722-4eec-88b3-a7a60142e449@leemhuis.info>
Date: Thu, 4 Dec 2025 15:44:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
 <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
 <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1764859499;8e4e9122;
X-HE-SMSGID: 1vRAZk-009Fkr-0b

Lo!

Matthias, AngeloGioacchino, have you maybe looked into regression that
seems to be caused by 72d63fa0563f8 ("arm64: dts: mediatek: mt8183:
Migrate to display controller OF graph")?

Evans Jahja, just to be sure: I suppose it still happens with 6.18
final? And have you tried if reverting the change fixes this ("fix the
issue just by using the dts from the other version" might have changed
other things as well, that's why I'm asking)

Ciao, Thorsten

On 11/28/25 03:59, Evans Jahja wrote:
> Hi,
> 
> There has been a regression in the dts for my system
> mt8183-kukui-krane, where changes in dts/mediatek/mt8183.dtsi broke my
> machine.
> 
> The display works under v6.17.9 but is broken in v6.18-rc7. I was able
> to replicate / fix the issue just by using the dts from the other
> version.
> 
>> On Wed, Nov 26, 2025 at 3:01 AM Evans Jahja <evansjahja13@gmail.com> wrote:
>>>
>>> Hi,
>>>
>>> I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
>>> krane sku176 board. (mt8183-kukui-krane)
>>>
>>> The display failed to initialize on the mainline kernel (linux
>>> 6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
>>> works fine.
>>>
>>> config: https://bugzilla.kernel.org/show_bug.cgi?id=220803
>>>
>>> With the system on mainline kernel, I was able to check the serial
>>> console, the error on dmesg looks like this:
>>>
>>> [    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
>>> pipeline for MMSYS 0
>>> [    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
>>> built with 9 components.
>>> [    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
>>> pipeline. Last component: 38 (ret=-2)
>>> [    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
>>> mediatek-drm failed with error -22
>>>
>>> Temporarily modifying mtk_drm_drv.c by commenting calls to
>>> mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
>>> display to function even on mainline. I was also able to add some
>>> logging and determine that building the HW pipeline for CRTC_MAIN
>>> works, but because building CRTC_EXT fails, the entire display would
>>> not initialize.
>>>
> 
> I think this is the issue:
> https://lkml.org/lkml/2025/9/12/1242
> 
> On Wed, Nov 26, 2025 at 2:06 PM Evans Jahja <evansjahja13@gmail.com> wrote:
>>
>> Hi Angelo, I was able to isolate the problem further to the dts. After
>> bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
>> seems like this is the first commit that introduced the issue on my
>> device.
>>
>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>
>>     arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>>
>> I am linking my full bisect log here:
>>
>> https://bugzilla.kernel.org/attachment.cgi?id=308962&action=edit
> 
> where we're unconditionally adding mmsys_ep_ext.
> 
> The issue seems to be caused by the recent addition of CRTC_EXT on the
> base mt8183
> 
> Please kindly take a look. Apologies for any mistake, this is my first issue.
> 
> Evans Jahja
> 
> 

