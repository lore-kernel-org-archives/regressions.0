Received: from mta0.migadu.com (out-104.mta0.migadu.com [91.218.175.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0254655
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791104153; cv=none; b=BKmdaNMYFJjm36KohO+24r07K7doZ1hFA6btdTnLizYhjZLbdTDhGlQEashdXTrTWDIaeShvotrtTAc8kjnWK/sipeiArx11LunFC1eRUrctx94jsCEwt2e5l/1zm/HeRuDIte6IDHQ8kyNJrjxSvUnMEbnDDgbVBV3nYKlEMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791104153; c=relaxed/simple;
	bh=95FzXsUz9I2g/oj+AL1i7jzIP1yuWrft5Pt9H0Ql5q4=;
	h=Message-ID:Date:MIME-Version:From:Subject:References:To:Cc:
	 In-Reply-To:Content-Type; b=XCRvc2tYzSOZgUJCgdemMdw5q5+fRBWQ4vL1MDDil9pfxKVJSJHo3FaS+rkYVtu//v3+6jge20V6EvuIUI6zVudsGXNpuX3updalV6ny8Bxj9r0vOYrO4S4R8+8URAy4eelA0yCt8Izz2EDLQuZWRiXdmtAkpRSC8imKbsEGD+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz; spf=pass smtp.mailfrom=gamesplit.cz; dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b=rRNOn+On; arc=none smtp.client-ip=91.218.175.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b="rRNOn+On"
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=95FzXsUz9I2g/oj+AL1i7jzIP1yuWrft5Pt9H0Ql5q4=;
 c=simple/simple; d=gamesplit.cz;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791104146; v=1; x=1791708946;
 b=rRNOn+Onmc02mMNLdITIX7EssutR5XoXEPhfgpvz/Y+2nNdSdVYqdghWcy7uDgKQe1a6Cxte
 YRFDJg5uDX7LiGwaEfv7BmFIUMdKZoZXTwRoEuamldVqyx/eYNS6gfI0gd7W5SjkJlNBFhzEole
 0DiIG882ykGMLheGDV8qnh4tTCjPM/zdRzVjavUd7ee9zD+i1W9hNgCHha56/0MxUGkzTlU49ed
 UGsFSHYwpGHDlB8IS3Z1xxPSNONvWKaVXy+y2Ap6jEJ7+tY2LR0lVjpnus2Aekj2NqeyQESUnlx
 i0MvkFxMC6MqiKybe4fWPj5ZozJ3MpmByylyKxLfBCv3Q==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a0701e863e5c39b9;
	Sun, 04 Oct 2026 08:55:40 +0000
X-Mizu-Trace-ID: a0701e863e5c39b9
X-Migadu-Flow: FLOW_OUT
Message-ID: <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz>
Date: Sun, 4 Oct 2026 10:55:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Frantisek Musil <lister@gamesplit.cz>
Subject: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks hi-res
 wheel scrolling over Lightspeed receiver (G903)
Content-Language: en-MW
Reply-To: Frantisek Musil <lister@gamesplit.cz>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz>
To: regressions@lists.linux.dev
Cc: jkosina@suse.com, jikos@kernel.org, saurla@saurla.com
In-Reply-To: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Bisected regression, no maintainer response on Fedora Bugzilla in three 
weeks: bugzilla.redhat.com/show_bug.cgi?id=2531858 
<https://bugzilla.redhat.com/show_bug.cgi?id=2531858>

Logitech G903 LIGHTSPEED mouse, connected via its Lightspeed USB 
receiver: hi-res wheel scrolling is broken from boot since kernel 7.2.4 
(still broken in 7.2.8). Each wheel click delivers the full legacy 
scroll value (120) in one event instead of ~8 subdivided hi-res steps 
(15 each) -- feels like the wheel suddenly "speeds up". No userspace 
config involved.

Bisected to:
   f0866517be9345d8245d32b722574b8aecccb348
"HID: logitech-hidpp: sync wheel multiplier on wheel mode changes"
   Signed-off-by: Lauri Saurus <saurla@saurla.com>
   Signed-off-by: Jiri Kosina <jkosina@suse.com>

Connecting the same mouse via USB cable (no receiver) is unaffected -- 
isolates this to the receiver/DJ reconnect path, where 
hidpp_connect_event() fires repeatedly during normal use and the new 
resync logic in this commit appears to desync the cached 
wheel_multiplier from the device's real mode.

Reverting this commit fixes it, confirmed stable on 
kernel-7.2.8-200.fc44. A device-specific quirk limiting the resync to 
not apply to the G903 did not fix it, so I don't have a minimal surgical 
patch -- only a full revert to offer.

HW: G903 LIGHTSPEED (046d:4087) via Lightspeed receiver (046d:c53a), 
Fedora 44, kernel 7.1.13 (good) .. 7.2.8 (bad).

Happy to test patches or provide more traces.

Thanks,
Frantisek Musil

