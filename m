Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150718C332
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673357; cv=none; b=CJV/dDpJ5XCxdxlI7B4G5vj/HlvwH5+3WepeD8oFS0/Qv381GDNv1Dhx044qwFDgDLkOgMFc5BW4CNXR59cMAJrkznr8dJQqF6p4PmzJ7kFEsRtje/GpGL4Njb0C0WuquM5etHrgWwshrWEoh2GcF27xZEwAoZXB1U01JHpZXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673357; c=relaxed/simple;
	bh=Aq7XaisW+RJqe/H+drNideQ3t1Pj9rSnevV6AveInEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=pXHQlVDLeeCpSdCc3K98HI3qL9aioV5WmfAH4N5JHiEBcylq3WiAB6tA3gxTL0uT+dSUqN6rCOCcLJQTr7KSzI0YLK18srv85byFLav7WjVIi3MRmvK0Xv2Q2xQSlWq4ui3O0QFol9VpgWRPqKIF/f37uRyH8lAUe9me0x27y2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LahstIJN; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LahstIJN"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gX52C2kS0z49xN;
	Fri,  5 Jun 2026 17:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780673347;
	bh=Aq7XaisW+RJqe/H+drNideQ3t1Pj9rSnevV6AveInEY=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=LahstIJNfrSyrqtCu2kPhjxAJ5WT27lIGTLcnYU6sAaoQ+iZjir/JrzLJTjTytqKM
	 UEPJU030VMaRKHeggKEbAciioz7yGmGcHOulycwxAmP3BIDDqrFRes755vaYT05VDP
	 j/NIpbMWVk9aF/id9OFoIo10+oMFrSmQB8lgvVfj7YaSjofd/Y3q755OHw2WJgl860
	 J8tOyF2FiFjWtIbC0DRaEtfItwDlqU2xAoG2usx+Dsptze+tNSe4Kq2lhiyASJZGkp
	 Ll6GjXWv/f/22lDrVect89j5Jbn2F1Msw+cvyzsjJg1ufLJei6AjpFvu/uKsDtl/Ix
	 OpFXNrFi7u81w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gX52C1ztPz4B1M;
	Fri,  5 Jun 2026 17:29:07 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gX52B5vwbz8sgw;
	Fri,  5 Jun 2026 17:29:06 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2814F61842;
	Fri,  5 Jun 2026 17:29:06 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c7d094d2-f917-41e7-92bf-71b24b195268@leemhuis.info>
Date: Fri, 5 Jun 2026 17:29:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: regressions report as of Linux 7.1-rc6 post (was: Linux 7.1-rc6)
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: 
 <CAHk-=wjWS2O9NPwgPuGbcEfdTUJGBJ1hWE8CNZciTta-yVnRQg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCaOO74gUJHfEI0wAKCRBytubv
 TFg9Lc4iD/4omf2z88yGmior2f1BCQTAWxI2Em3S4EJY2+Drs8ZrJ1vNvdWgBrqbOtxN6xHF
 uvrpM6nbYIoNyZpsZrqS1mCA4L7FwceFBaT9CTlQsZLVV/vQvh2/3vbj6pQbCSi7iemXklF7
 y6qMfA7rirvojSJZ2mi6tKIQnD2ndVhSsxmo/mAAJc4tiEL+wkdaX1p7bh2Ainp6sfxTqL6h
 z1kYyjnijpnHaPgQ6GQeGG1y+TSQFKkb/FylDLj3b3efzyNkRjSohcauTuYIq7bniw7sI8qY
 KUuUkrw8Ogi4e6GfBDgsgHDngDn6jUR2wDAiT6iR7qsoxA+SrJDoeiWS/SK5KRgiKMt66rx1
 Jq6JowukzNxT3wtXKuChKP3EDzH9aD+U539szyKjfn5LyfHBmSfR42Iz0sofE4O89yvp0bYz
 GDmlgDpYWZN40IFERfCSxqhtHG1X6mQgxS0MknwoGkNRV43L3TTvuiNrsy6Mto7rrQh0epSn
 +hxwwS0bOTgJQgOO4fkTvto2sEBYXahWvmsEFdLMOcAj2t7gJ+XQLMsBypbo94yFYfCqCemJ
 +zU5X8yDUeYDNXdR2veePdS3Baz23/YEBCOtw+A9CP0U4ImXzp82U+SiwYEEQIGWx+aVjf4n
 RZ/LLSospzO944PPK+Na+30BERaEjx04MEB9ByDFdfkSbM7BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJo47viBQkd8QjTAAoJEHK25u9MWD0tCH8P/1b+AZ8K3D4TCBzXNS0muN6pLnISzFa0
 cWcylwxX2TrZeGpJkg14v2R0cDjLRre9toM44izLaz4SKyfgcBSj9XET0103cVXUKt6SgT1o
 tevoEqFMKKp3vjDpKEnrcOSOCnfH9W0mXx/jDWbjlKbBlN7UBVoZD/FMM5Ul0KSVFJ9Uij0Z
 S2WAg50NQi71NBDPcga21BMajHKLFzb4wlBWSmWyryXI6ouabvsbsLjkW3IYl2JupTbK3viH
 pMRIZVb/serLqhJgpaakqgV7/jDplNEr/fxkmhjBU7AlUYXe2BRkUCL5B8KeuGGvG0AEIQR0
 dP6QlNNBV7VmJnbU8V2X50ZNozdcvIB4J4ncK4OznKMpfbmSKm3t9Ui/cdEK+N096ch6dCAh
 AeZ9dnTC7ncr7vFHaGqvRC5xwpbJLg3xM/BvLUV6nNAejZeAXcTJtOM9XobCz/GeeT9prYhw
 8zG721N4hWyyLALtGUKIVWZvBVKQIGQRPtNC7s9NVeLIMqoH7qeDfkf10XL9tvSSDY6KVl1n
 K0gzPCKcBaJ2pA1xd4pQTjf4jAHHM4diztaXqnh4OFsu3HOTAJh1ZtLvYVj5y9GFCq2azqTD
 pPI3FGMkRipwxdKGAO7tJVzM7u+/+83RyUjgAbkkkD1doWIl+iGZ4s/Jxejw1yRH0R5/uTaB MEK4
In-Reply-To: 
 <CAHk-=wjWS2O9NPwgPuGbcEfdTUJGBJ1hWE8CNZciTta-yVnRQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178067334643.3119138.2649519504026317842@mxe9fb.netcup.net>
X-NC-CID: 6StfhMGjb4hj6gPYuwoSupTE5NtKx1ue9aW9Tb+VQjQ1tlDKkDA=

On 6/1/26 00:36, Linus Torvalds wrote:
> Well, I wouldn't call this "small", but it is certainly smaller than
> rc5 was. And I don't think there's anything particularly scary here,
> so maybe we're still on track for a normal release cycle. Let's see.

Hi Linus! Still experimenting a bit with a new format for the regression
report. To keep the work manageable, I chose to trim things down and
skip a few things:
* regression fixes sitting in a pending-fixes branch that most likely
will head to mainline before the next rc, as the subsystem maintainers
usually sent a weekly PR right before a new rc.
* unresolved regressions for older cycles where no ad-hoc fix is
available (e.g. neither a fix nor a revert), so there is not much we can
do about those
* fixes for regressions recently found in releases more than about one
year ago

Here we go:

#######################################################################
7.1 regressions afaics unlikely to be fixed for -rc7, unless you chose
to intervene.

---
cpufreq/amd-pstate: switching to performance profile broke
https://bugzilla.kernel.org/show_bug.cgi?id=221505

Known for 4 weeks days and fix is available, but Rafael is "unable pull
it this week":
https://lore.kernel.org/all/20260530154121.1670781-1-superm1@kernel.org/
https://lore.kernel.org/all/CAJZ5v0ghALXyU8tf0gcT+qirhde7ah8_rQ9+FryuArfbLTe01A@mail.gmail.com/

Side note: there is a related problem that developers are still looking
into:
https://bugzilla.kernel.org/show_bug.cgi?id=221473
https://lore.kernel.org/lkml/2e3a5f9a-69fe-4790-8b8b-2d1622977a2f@amd.com/

#######################################################################
Regressions pre-7.0 afaics unlikely to be fixed for -rc7, unless you
chose to intervene.

---
rtl8xxxu: RTL8188FTV (0bda:f179) fails to authenticate/configure since 6.19
https://bugzilla.kernel.org/show_bug.cgi?id=221394
https://lore.kernel.org/linux-wireless/8a4c664f-231f-437e-b010-b741c7ed7be8@leemhuis.info/

Known for 6 weeks. A fix was sitting in a sub-sub-subsystem tree for a
while and recently turned up in in next as ef771eabc79d5f ("wifi:
rtl8xxxu: Detect the maximum supported channel width") [next-20260604],
but from the outside it looks a bit like it's still only on track for
merging in the next cycle:
https://lore.kernel.org/linux-wireless/c57de68e-5d57-4c26-898f-8a284bb25381@gmail.com/

#######################################################################
7.1 regressions unlikely to be fixed for -rc7

---
loop: loop drive broken due to some race exposed by an unknown change,
detected by syzbot
https://lore.kernel.org/lkml/69e2ca14.a00a0220.1bd0ca.0031.GAE@google.com/

Known since 7 weeks, culprit unknown. People were really busy trying to
get this resolved, but activity slowed down in the past few days without
a fix in sight (or I missed something).

---
drm: amdgpu: handling FreeSync via MCCS broke VRR
https://gitlab.freedesktop.org/drm/amd/-/issues/5286
https://lore.kernel.org/amd-gfx/44069eb146824aa195312f5b02c49287@valvesoftware.com/

Known for 24 days and a fix for one of the problems is heading towards
mainline after some prodding now, but seems there are more problems that
might remain unresolved -- but there is the plan to consider a revert
next week:
https://lore.kernel.org/amd-gfx/399d0170414b4304823e866b04ab518a@valvesoftware.com/
https://lore.kernel.org/all/CADnq5_McpRJzu1_UttS2NjnX5GRpTZG7H2oKpQ44yrQo3EOX%2Bg@mail.gmail.com/


#######################################################################
7.1 regressions that might or might not be fixed for -rc7

---
HID: input: Oops during boot
https://lore.kernel.org/lkml/20260602011949.2825852-1-rafael@rcpassos.me/
https://lore.kernel.org/lkml/ah6vRH9J9LSvnKWW@mail.iam.tj/

Fix is 426e5846eba75f ("HID: Input: Add battery list cleanup with devm
action") [next-20260602] and might make it to mainline if the HID folks
send a PR this week.


#######################################################################

Ciao, Thorsten
