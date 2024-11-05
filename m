Received: from mail.581238.xyz (86-95-37-93.fixed.kpn.net [86.95.37.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7DE1D6DB9
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.95.37.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816708; cv=none; b=bvE+muxeXIqoJkQd/g46v4+RRc47hQM3YPiMEAkI0EinW/HY5YaHge2NkedSZ1+p+VGsgT+dilq8rLcJCiwMlM61Q4Rrp1KKx+AVv0pKzY14SjLkfMXLCypnL0wCd366+HqlAU7B7azQmTWMEOpFE7ZNLne25NfFVNa1hUtjyt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816708; c=relaxed/simple;
	bh=y52QCj/lL5Gssp6Ud2UwA87WV5sqqS9ScP3EA1YZL+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpCDzyrGc/MozI9OHHARIlTVZvHl4N3t2LdBok0bkv2eTiKUbNPyCdnYi6daR1XLYEBJExlw3YBO0Ue49FueiOsr1J5BUdimBaMOWAFy/EVTtM5E9otVRSywVfmJFLTkTf1f0zNbx0ZSsGL4InZuEeaMSj5TaN7/etlIUDET6W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz; spf=pass smtp.mailfrom=581238.xyz; dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b=xpcefahK; arc=none smtp.client-ip=86.95.37.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=581238.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=581238.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=581238.xyz header.i=@581238.xyz header.b="xpcefahK"
Received: from [192.168.1.14] (Laptop.internal [192.168.1.14])
	by mail.581238.xyz (Postfix) with ESMTPSA id 98D3343088F3;
	Tue, 05 Nov 2024 15:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=581238.xyz; s=dkim;
	t=1730816704; bh=y52QCj/lL5Gssp6Ud2UwA87WV5sqqS9ScP3EA1YZL+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=xpcefahKjznDoD3fifBiwm7ZNcw7SXDlZLjvYeshlG01S5J9S+9io3wmpqjtci+B9
	 SxGnf5Oh+t6o+0EJa43jHYovQE+q5VZjbEF0GO0cfKA3lvRwVKfELxilURBrwRCKpK
	 3sR7FO2CEY0fnLKDKvT/v7+8P+DAkMV64uvbbprI=
Message-ID: <da14058b-3f40-4725-827b-0e5e1e8135a8@581238.xyz>
Date: Tue, 5 Nov 2024 15:25:04 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Sanath.S@amd.com,
 christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
 <2024110542-moaning-zap-7ac2@gregkh>
 <20241105140231.GH275077@black.fi.intel.com>
 <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>
Content-Language: en-US
From: Rick <rick@581238.xyz>
Autocrypt: addr=rick@581238.xyz; keydata=
 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
In-Reply-To: <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mario,

On 05-11-2024 15:21, Mario Limonciello wrote:
> On 11/5/2024 08:02, Mika Westerberg wrote:
>> On Tue, Nov 05, 2024 at 11:54:55AM +0100, Greg KH wrote:
>>> On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
>>>> Rick reported that his Pluggable USB4 dock does not work anymore after
>>>> upgrading to v6.10 kernel.
> 
> If I'm not mistaken Rick was talking about a Dell WD19TB dock which is 
> TBT3, not a Pluggable USB4 dock.
> 

To prevent any confusion; I don't own any Dell WD19TB dock. I had these 
issues with the UD-4VPD dock.

> Nonetheless I wouldn't be surprised if other docks and devices have 
> problems.
> 
> We have an internal report at AMD of something similar happening with 
> TBT3 storage devices.  After this lands I'll ask that team that reported 
> it to see if it helped them too.
> 
>>>>
>>>> It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
>>>> access polling delay") makes the device router enumeration happen later
>>>> than what might be expected by the dock (although there is no such 
>>>> limit
>>>> in the USB4 spec) which probably makes it assume there is something
>>>> wrong with the high-speed link and reset it. After the link is reset 
>>>> the
>>>> same issue happens again and again.
>>>>
>>>> For this reason lower the sideband access delay from 5ms to 1ms. This
>>>> seems to work fine according to Rick's testing.
>>>>
>>>> Reported-by: Rick Lahaye <rick@581238.xyz>
>>>> Closes: https://lore.kernel.org/linux- 
>>>> usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
>>>> Tested-by: Rick Lahaye <rick@581238.xyz>
>>>> Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling 
>>>> delay")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>
>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
> 
>> Thanks!
>>
>> Applied to thunderbolt.git/fixes.
> 
> I'm a few hours late to the party, but if you update the commit message 
> for my above comment feel free to add my tag too.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 

Kind regards,
Rick Lahaye


