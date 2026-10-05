Received: from mta0.migadu.com (out-149.mta0.migadu.com [91.218.175.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A42240611
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 21:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235215; cv=none; b=Zf7kPwyHRGlnLx6tvWnj+jKMVcU9SEJ4FOW1593kYxzfNRsemj2T/kNAPnZroJPtOJqV+H/Z3PbRKvmyblkEbJKl36vEVOANO55/4jw2o/hSizNqDs6FTNxMw7Q01Adsgd3g4kzpHOFTm5pHqU18FUb9oQnl5o9AdqO0MXYPxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235215; c=relaxed/simple;
	bh=qDpQWo7PvC7vrbDijNRx38zfe4NyVLJdiIRXVzL/MYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzUwLNnM0LRIcRpbKyfbaupVyrtpJ7i873JIUjChJ7mZuiJqUc907IEINAJIFT50G05VPvtmuCMOYQPqIEjwanZoWcv3qZh1mp7N0IrtXkGMtk4yEMiO96HHzV4CEjCEvz0fWK3xXoY68giXzHct3b2HjLZTahu+jS3fhHoM98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz; spf=pass smtp.mailfrom=gamesplit.cz; dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b=Y34JTrBa; arc=none smtp.client-ip=91.218.175.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b="Y34JTrBa"
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qDpQWo7PvC7vrbDijNRx38zfe4NyVLJdiIRXVzL/MYo=;
 c=simple/simple; d=gamesplit.cz;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791235205; v=1; x=1791840005;
 b=Y34JTrBaWW2ip1ZQ0ky26RHG9uNJBTgI7MHbWU6eZDDyGZt6usexkz/mFKviZlMta40oIF6X
 qIM1UW0QS3eJQXDY+VG5+MR6vNASqtDart1ZiEd4UnkM8mc9sn49n1mwFY84xRkxJwFkiOaLyWJ
 dvgneYii77FduV8rDcT6fUdJNKyzyqgyuMspZqj0Q2A2DaQ2/dwheVMT/PmnRn1NT65wfP5Ebx2
 XyUGfa7RljFD/j+qV2layR2bHET68sRNJTnUDU/9Kzya3X27S8zaHrtz8N2PGkzc5CSldXv+je7
 uF+M8oQCGZyRAOiwI26MMGxQjh4bQHU0icv0OxrzHGbHw==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6a381f9d468a3bc4;
	Mon, 05 Oct 2026 21:20:04 +0000
X-Mizu-Trace-ID: 6a381f9d468a3bc4
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb961991-b746-4f8f-bb76-c597b35a908b@gamesplit.cz>
Date: Mon, 5 Oct 2026 23:20:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks
 hi-res wheel scrolling over Lightspeed receiver (G903)
To: Lauri Saurus <saurla@saurla.com>
Cc: Jiri Kosina <jikos@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "jkosina@suse.com" <jkosina@suse.com>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz>
 <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz>
 <0IXbR44wf-idjlLSV2kHpzPm88Rs_orpaG-CJumHqfydxGdMNnuobRi0Oz8lW2cdpibztLCb1HK2MpcAw3lgsCzSmugEbQBf70Zjooz6ZLY=@saurla.com>
 <72d144aa-bd56-4ee5-a504-9cfcb329eb44@gamesplit.cz>
 <pI2--urSOUMdyRKpMPDftneDAGdGm05IPF8Xt8FhYnOLhbErUDQRh_6Yq1wqKW6559W2APlI2QtM03TJOrjRobiIoUSsMOrutYfyZP0W3OY=@saurla.com>
 <dfbc41ec-7200-4178-9bc2-a8b4d6b9654e@gamesplit.cz>
 <Qcqpyk51pmEh4pab4ob63O_xwOfVnMZbRigEHshfaClUdXYlQgHvsdGqCqGyI8o8XctHqVSDpoTW5Ngsyz03wlX9ghiv8dpLREphQW8Gppg=@saurla.com>
 <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz>
 <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com>
Content-Language: en-MW
From: Frantisek Musil <lister@gamesplit.cz>
In-Reply-To: <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lauri,

Did the git revert test: checked out f0866517be93, ran `git revert` 
(clean, no conflicts), compiled against my Fedora 44 kernel-7.2.8 
sources, loaded it, rebooted. Scroll works correctly now.

Also saw in the original review thread 
(https://ratatoskr.run/linux-input/2026/05/16995921/t) that it 
onlyhandles REPORT_ID_HIDPP_LONG (0x11), ignoring Very Long (0x12) - 
yousaid you'd add that but it doesn't look like it landed. Captured raw 
hidraw traffic during SetWheelMode (kernel and Solaar) and whilespinning 
the wheel hard. Never saw a single 0x12, only 0x11/0x10. Sodoesn't seem 
to be it for my hardware.

Could this be firmware-related? Mouse is MPM 23.01.B0013, receiver 
40.03.B0014. No idea if there's a newer version or if it'd matter,just a 
thought on why you can't reproduce it.

Frantisek

Dne 05. 10. 26 v 14:42 Lauri Saurus napsal(a):

> Hi.
>
> Thanks for the logs.
>
>> Right after receiver connect, no Solaar running, every REL_WHEEL_HI_RES
>> event has value 15 - never 120. So the value itself looks correct. But
>> when I counted how many of these fire between each legacy REL_WHEEL
>> click, most are 8 (correct), but quite a few are 9, 10, even 11. So
>> instead of 120 units per physical click it's sometimes up to 165 -
>> that's the "scrolls too much" I'm seeing, it's not a wrong value, it's
>> extra events.
> I checked the log and did counting also. I did not find any range where there would be more than 8 REL_WHEEL_HI_RES events in same direction without a legacy REL_WHEEL in between. I did find some ranges with 9-11 REL_WHEEL_HI_RES events in a row, but those were such cases where scroll direction was changed (15 vs -15). Eg. rows 2981-3002.
>
> Based on these logs it seems to me that the driver is behaving correctly. Can you verify once more that this commit f0866517be9345d8245d32b722574b8aecccb348 actually is what breaks the scroll for you, by checking out this commit, reverting it with git revert, compiling against your Fedora kernel sources, loading the compiled hid_logitech_hidpp, and finally testing whether the issue persists or not?
