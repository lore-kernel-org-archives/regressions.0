Received: from cmx-mtlrgo001.bell.net (mta-mtl-008.bell.net [209.71.208.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAF30DECB
	for <regressions@lists.linux.dev>; Mon,  6 Apr 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.208.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775462280; cv=none; b=V6NtmEzLGop4DtjJ6MzbSKSRZPBzvmaQ62vtaJC7iZ5JF8uIwtYpxUSPCYnN6M26T1smfnp0TpKa8yannXckXwUOJG59Q8Nfi23BH2BQ7+FZwzOG8xXr+xYP1Lqa7T2OpkpsphTtQZZ6L/M6OnFgU+EJQo57Xjqm0cFLoEZq9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775462280; c=relaxed/simple;
	bh=c0N7m5z8hZVNWJq5uAs4Kn5/y5ehEpZ/+gE27TP3eAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USex0JZz2lPN/dn8x6loRIIjZsh7BdVaBKfTU8xNjuvWhYUOIanxiusvuFWY01NJiJCGO1+tohk8r1LwKI/JLEHW4BEAC354C4nRXmCZqQUf2dF5mwMcovrCHg5AzyN/ZhzrCt9AkQKyZMmOEGvrk7Tq+8oqr+v0eP/JzZEjmwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=fEtg9w3E; arc=none smtp.client-ip=209.71.208.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="fEtg9w3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1775462279; 
        bh=ee/ibGxRB7ZMYV1LgEYDA/tCFpV2VxAtOGiEdEyBcsk=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=fEtg9w3EirxcQnPfwBcaro031f5i/KHs7BGNg2+G0d3nXBq+DjpY10iaUoQVW82abPAg59vEPkEApEyUeJ8btD+OCeAx0Qj4HXWd1HxTx1kaTaQBTsiZseVZsFSzR674qHHzqni8ibxjZvvG2y/j/RxWAkLfEPxAdiUciaWK8TqMzpDKSrCox3l94/q8gDjSq05ChXeiNOUddhsJ1arFpLMXIL6byMH2CMMBbVNzgxhgaxbNGxOLjnlhn9PnExgvC/115fw3MkWusvDhbh1QSReR+kIDwYgqZsBFTPmVCVjh1c4IDmQlkSUPcuUit8bVze/BwTxZhcfD4ENtMrdS+A==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: matt.fagnani@bell.net
X-RG-Rigid: 69BEEF93021C3F91
X-RazorGate-Vade: dmFkZTEwdeOu4RFMK0bgxNPhFO6olhcTTPjSXyYQ4ESBdvLEPeNsUtn3i7fQCRLygdbADflYYybHj4BpueTVDOTen5ln1JzbdbKHPhTdhhNQSLcVDkQSvwmtB/nskwz+3ltD5Q4mkjsTsd44WDJx1Jhf04HOzT6Ahy/SdkZI0bV6rpHFmy+ylGlX1Z/lGDxd60P3IDn0oOGXtbd2LRu0Um5eAc4M6dlHsFDZidudjBt0ahqdC5utZ/5K7NDOTgENJ1od7VGPqDLexbGrCoMXBY2VQfhP6dD6OAOtl99YVPkXE+61JFCnh9u7Rt5zAqM7b4+ccpVjxoUeCXYCtD260Ovj9xE9Zh9xUyJqBzI9lUKyzNqutU5h61q5RpyLOHEkjL2DJt4oOPz12sZWcUuphO+RzrqtWpyGMw7Lb4+pvFsT79hg57kJipIFSkdxxGjGKbKdZkXEk8q4EGLdoIzqmUA4DgL9AvydlmkO0iucHSlsTgLYIKxCV7hVeIGSsb/0U2YNHu4JjpgTb/f00JtrAgZQOOf6HQKWegpwNVQUzr5pv612elDG4/EKQRPgDmND7CmfaAxsrsqMINDk5op5S34PrkGxlfG/dAgolhSXJ/fiLatEaTSgTm4fJI9m6Z4N3W97Iqo7D/V+hAZOn+ch4vKeNyvFE9N9CLbSw/SAvzo5EppQyw
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.2.10] (70.48.33.60) by cmx-mtlrgo001.bell.net (authenticated as matt.fagnani@bell.net)
        id 69BEEF93021C3F91; Mon, 6 Apr 2026 03:54:40 -0400
Message-ID: <35ed8f9a-66c2-40c3-a545-da4af629014f@bell.net>
Date: Mon, 6 Apr 2026 03:54:39 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: Warnings and errors in drm_mode_config_cleanup when booting
 6.19.10 and 7.0-rc5
To: Greg KH <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <a8f058b3-ea2c-4af1-a19b-9ae2db46754c@bell.net>
 <9652ce0b-bb4c-489d-9e32-89c5af5c8101@leemhuis.info>
 <2026040259-glacial-reversal-9a75@gregkh>
Content-Language: en-US
From: Matt Fagnani <matt.fagnani@bell.net>
In-Reply-To: <2026040259-glacial-reversal-9a75@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-04-02 08:12, Greg KH wrote:
> On Sat, Mar 28, 2026 at 11:52:48AM +0100, Thorsten Leemhuis wrote:
>> Matt, thx for the report.
>>
>> On 3/28/26 11:30, Matt Fagnani wrote:
>>> I could try to bisect. The commit
>>> e493c135980f90c20308d1a98f2e0d1223951e94 drm: Fix use-after-free on
>>> framebuffers and property blobs when calling drm_dev_unplug was included
>>> in 6.19.10 and changed drm_mode_config_cleanup https://git.kernel.org/
>>> pub/scm/linux/kernel/git/stable/linux.git/commit/?
>>> h=linux-6.19.y&id=e493c135980f90c20308d1a98f2e0d1223951e94
>> Did a quick search. Turns out this is mainline commit 6bee098b914176
>> ("drm: Fix use-after-free on framebuffers and property blobs when
>> calling drm_dev_unplug") -- and when searching for that (FWIW, this is
>> not widely known, but that is really helpful in case like this, as the
>> mainline commit id is way more relevant) is turns out that is in the
>> process of getting reverted:
>>
>> See https://lore.kernel.org/all/20260326082217.39941-2-dev@lankhorst.se/
>> or 45ebe43ea00d6b ("Revert "drm: Fix use-after-free on framebuffers and
>> property blobs when calling drm_dev_unplug"") [next-20260327
>> (pending-fixes)].
>>
>> Sasha and Greg: you might want to make sure to pick this up.
> When it shows up in a Linus-released kernel, can someone remind us?
>
> thanks,
>
> greg k-h

7.0-rc7 https://lwn.net/Articles/1066405/ had the patch Revert "drm: Fix 
use-after-free on framebuffers and property blobs when calling 
drm_dev_unplug" 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v7.0-rc7&id=45ebe43ea00d6b9f5b3e0db9c35b8ca2a96b7e70 Thanks.

Matt


