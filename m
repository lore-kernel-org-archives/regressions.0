Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A663C1985
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776849069; cv=none; b=jW9egG4JW7y/AkFji7nmBlUNjnsUnhKPxgUvDsH9F/5hkAN8pWAAE06PQ8hTCWV8pSky5nF6xqfJBlHTYf8XIuYIurdgMAQ37lgHbnv2kwMWBBSA2mjbcfVX/T7DmImwbNYCxeexk1ZylTVhcC9OmKDxHnw/28Ew2w2RYOv/q14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776849069; c=relaxed/simple;
	bh=VGDrsaKE6igUgJZeM5UoFALIu5tBVuOb4ltGy8GqtFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBW9MtQOzEBsYMBm+8RkBDNk2P0qtddXu2bc5EJTVG7L9KWKlYRB0HK8ICiShibDWWSVFiutWRwJWHjhQHLVvHoL2+g2/fFXgIEHmJF6c9nfi9G1sBNf1V+OF90AjwzshWuVoF2WrgrNpJEGB+egR7pGph4wk0wdp6b2nIpRgKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TlvXtQwJ; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TlvXtQwJ"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g0tjx1x4gz3wg8;
	Wed, 22 Apr 2026 11:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776849045;
	bh=VGDrsaKE6igUgJZeM5UoFALIu5tBVuOb4ltGy8GqtFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TlvXtQwJ3qOmmtusQ81CxnEbEXW8IvkLo/YXRrshqFNEfWW+mSE3q4BYxh4AOG7mg
	 7T17h4XDp/yYcUgDICjjbJoePrI/cM+lOv2BNbp84lhpwL6WPzr2PZDe3bmWNwsHK5
	 ynFUy98lwMj13sNEb3JMIxB4djGv1klP5a9vdxMEhesF2CO7tF6L9rdIZffyWOgze/
	 t2QpF4/Wy7ZnLBCKWZn0wZtgLeph5MKNBtuRuduCFO3mi/32EoY/WfoXlX+n1G0lvu
	 /fZI+GubrKZaRpeE7avEtjpIDcjHPqcAktt2xMf/zNoHlMagyHQKmjcZoH+LExS4Gs
	 0FrSKjTOnYzOA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g0tjx1Bpzz3wb2;
	Wed, 22 Apr 2026 11:10:45 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g0tjw5chtz8sZg;
	Wed, 22 Apr 2026 11:10:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1E8F8632A6;
	Wed, 22 Apr 2026 11:10:44 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <50d70614-6681-4169-8c2a-e68128f88c9c@leemhuis.info>
Date: Wed, 22 Apr 2026 11:10:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
To: "Vojvodic, Relja (Reggie)" <Relja.Vojvodic@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: Shichuan Yim <shichuanyim@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>
References: 
 <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
 <2026030839-applied-prominent-b774@gregkh>
 <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
 <b3d8717f-07f7-4921-8808-55db94dfdc2e@leemhuis.info>
 <DM6PR12MB4354705B31704E35F281C5AA8744A@DM6PR12MB4354.namprd12.prod.outlook.com>
 <CA+tjKGqCmTQkxmdzrUfBxyENkMzocic1+OKS2bka5taGoy3SnQ@mail.gmail.com>
 <SA0PR12MB4368395D5071FC7AD375B6618740A@SA0PR12MB4368.namprd12.prod.outlook.com>
 <CA+tjKGrcV2p=2EabSjkYiRv=RNmOZq4_5Z49mu-irjJjgEkqCA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CA+tjKGrcV2p=2EabSjkYiRv=RNmOZq4_5Z49mu-irjJjgEkqCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177684904450.1964745.16047511871575263824@mxe9fb.netcup.net>
X-NC-CID: RVpK81Gxew8Ufc3kYT4xn5WBfE9ZEgRqRaVSOABLFCExbxXfAvM=

Reggie, Alex, has any progress been made to resolve this? Does not look
like it from here, but it's easy to miss something.

Is reverting the culprit (and maybe reapplying later in improved form)
and option? Sounds a bit to me like that might create more trouble than
it solves, but you are the better judges here.

Or should that be moved to
https://gitlab.freedesktop.org/drm/amd/-/work_items to ensure this does
not fall through the cracks?

Ciao, Thorsten

On 3/17/26 14:28, Shichuan Yim wrote:
> The EDID has not been modified; it was read directly using the cat
> command. This is actually the first time I've ever learned about the
> concept of EDID.
> 
> Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com> 于2026年3月17日周二 04:32写道：
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi,
>>
>> This EDID does not seem to have a HDMI VSDB or HFSCDB block within it. These blocks are where the SCDC bit gets set within the EDID. The lack of these blocks indicates that SCDC is not supported on this display.
>>
>> Has this EDID been modified in any way? Or is it the EDID right off of the display.
>>
>> Thanks,
>> Relja
>> ________________________________
>> From: hgfdgjn <shichuanyim@gmail.com>
>> Sent: Thursday, March 12, 2026 12:28 PM
>> To: Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com>
>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>; Koenig, Christian <Christian.Koenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is higher than the default 60Hz
>>
>> [You don't often get email from shichuanyim@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The populate_hdmi_info_from_connector() patch is in the stable master
>> and running on my device.
>> It appears to be a specific monitor issue.
>>
>> This is the EDID of the monitor I used to reproduce the issue.
>>
>> $ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
>> AP///////wAhY0MkAAAAACQjAQOANR14Loy1r09DqyYOUFSlSwCBgLMAlQABAQEBAQEBAQEBAjqA
>> GHE4LUBYLEUADyghAAAeAAAA/AAyNEZTMQogICAgICAgAAAA/QAwkB6lKAAKICAgICAgAAAA/wAw
>> MDAwMDAwMDAwMDAxAe4CAyKxSJAEAwESHxM/aAMMABAAOHgA4gB/aBoAAAEBMJDtim+AoHA4QEAw
>> IDUADyghAAAeKIOAoHA4KUAwIDUADyghAAAeAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
>> AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA6Q==
>> $ cat /sys/class/drm/card1-HDMI-A-1/edid | parse-edid
>> Checksum Correct
>>
>> Section "Monitor"
>>     Identifier "24FS1"
>>     ModelName "24FS1"
>>     VendorName "HKC"
>>     # Monitor Manufactured week 36 of 2025
>>     # EDID version 1.3
>>     # Digital Display
>>     DisplaySize 530 290
>>     Gamma 2.20
>>     Option "DPMS" "true"
>>     Horizsync 30-165
>>     VertRefresh 48-144
>>     # Maximum pixel clock is 400MHz
>>     #Not giving standard mode: 1280x1024, 60Hz
>>     #Not giving standard mode: 1680x1050, 60Hz
>>     #Not giving standard mode: 1440x900, 60Hz
>>
>>     #Extension block found. Parsing...
>> #WARNING: I may have missed a mode (CEA mode 63)
>>     Modeline     "Mode 8" +hsync +vsync
>>     Modeline     "Mode 0" +hsync +vsync
>>     Modeline     "Mode 1" 148.500 1920 2008 2052 2200 1080 1084 1089
>> 1125 +hsync +vsync
>>     Modeline     "Mode 2" 74.250 1280 1390 1420 1650 720 725 730 750
>> +hsync +vsync
>>     Modeline     "Mode 3" 27.027 720 736 798 858 480 489 495 525 -hsync -vsync
>>     Modeline     "Mode 4" 25.200 640 656 752 800 480 490 492 525 -hsync -vsync
>>     Modeline     "Mode 5" 27.000 720 732 796 864 576 581 586 625 -hsync -vsync
>>     Modeline     "Mode 6" 148.500 1920 2448 2492 2640 1080 1084 1089
>> 1125 +hsync +vsync
>>     Modeline     "Mode 7" 74.250 1280 1720 1760 1980 720 725 730 750
>> +hsync +vsync
>>     Modeline     "Mode 9" +hsync +vsync
>>     Option "PreferredMode" "Mode 8"
>> EndSection
>>
>>
>> This is another physically damaged monitor of mine, but I couldn't
>> reproduce this issue.
>> EDID for broken monitor:
>>
>> $ cat /sys/class/drm/card1-HDMI-A-1/edid | base64
>> AP///////wBBDB/C+yUAACIfAQOAPCJ4KivFrVBHpiYTUFS/7wDRwIGAMWgxfEVoRXxhaGF8Vl4A
>> oKCgKVAwIDUAVVAhAAAeQOcAaqCgZ1AIIJgEVVAhAAAaAAAA/ABQSEwgMjc1TTgKICAgAAAA/QAw
>> kB7mPAAKICAgICAgAasCAzDxTBAfBRQEEwMSAhEBPyMJBweDAQAAZQMMABAAZ9hdxAF4gABoGgAA
>> AQEwkOZvwgCgoKBVUDAgNQBVUCEAAB5aoACgoKBGUDAgNQBVUCEAAB4COoAYcTgtQFgsRQBVUCEA
>> AB7wPADQUaA1UGCIOgBVUCEAABwAAAAAAAAA/Q==
>>
>> If you need other information or testing, please ping me, and I will test ASAP.
>>
>> Thinks.
>>
>> Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com> 于2026年3月12日周四 23:14写道：
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>> Hi,
>>>
>>> I've brought up this issue with some maintainers on our team and we've begun looking into it.
>>>
>>> This issue has come up before and was fixed with this patch: "drm/amd/display: Improve HDMI info retrieval", which should be included in the stable master branch. You can double check if this is the case.
>>>
>>> In the meantime, could we get the EDID of your display to aid in the debugging?
>>>
>>> Thanks,
>>> Relja
>>>
>>> ________________________________
>>> From: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info>
>>> Sent: Thursday, March 12, 2026 9:33 AM
>>> To: Vojvodic, Relja (Reggie) <Relja.Vojvodic@amd.com>
>>> Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>; Koenig, Christian <Christian.Koenig@amd.com>; hgfdgjn <shichuanyim@gmail.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
>>> Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is higher than the default 60Hz
>>>
>>> On 3/8/26 10:56, hgfdgjn wrote:
>>>> 7.0-rc2 can also reproduce it; after locating the issue, it was
>>>> reproduced using the stable upstream master branch.
>>>
>>> CCing the amdgpu maintainers, as this seems stalled. Dropping Greg and
>>> stable, they most likely don't care.
>>>
>>> Relja Vojvodic, in case you missed it: this regression seems to be
>>> caused by a commit of yours: 3471b9a31ce352 ("drm/amd/display: Rework
>>> HDMI data channel reads") [v6.19-rc1]
>>>
>>> Ciao, Thorsten
>>>
>>>>> On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
>>>>>> Hi maintainers:
>>>>>>
>>>>>>   After updating to v6.19.6 on Arch Linux, if I set the refresh rate
>>>>>> higher than 60Hz, the monitor displays "No Signal".
>>>>>> I tried bisecting and found:
>>>>>>> # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/amd/display: Rework HDMI data channel reads
>>>>>>
>>>>>> This issue on my machine was caused by this change:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>>>>> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>>>>> index 267180e7bc48..5d2bcce2f669 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>>>>> @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_service,
>>>>>>      /*Lower than 340 Scramble bit from SCDC caps*/
>>>>>>
>>>>>>      if (ddc_service->link->local_sink &&
>>>>>> -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
>>>>>> +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite
>>>>>> ||
>>>>>> +        !ddc_service->link->local_sink->edid_caps.scdc_present))
>>>>>>          return;
>>>>>>
>>>>>>      link_query_ddc_data(ddc_service, slave_address, &offset,
>>>>>>
>>>>>>
>>>>>> It appears that scdc_present is always false on my device.
>>>>>> I reverted the change to write_scdc_data(), and the monitor works
>>>>>> normally at high refresh rates.
>>>>>
>>>>> Can you cc: the developers and maintainers of this change to let them
>>>>> know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show this
>>>>> issue?
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>
>>>
> 

