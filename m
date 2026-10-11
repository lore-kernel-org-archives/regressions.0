Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74A2D9ECB
	for <regressions@lists.linux.dev>; Sun, 11 Oct 2026 23:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791761065; cv=none; b=W+vA89Y5kDrWg1JPZSOjnN/27UyN0ZB4um0JFFqlzsFNEHpJdcIRcmCZrrnIsut7P+Bs/vRHyypiZg1qGgOttf5EDWtzpuMa+mftZ2I3ycUkMzRkPY7bxG1G3LzSndFiLVF/dhOt/TOD4S0tsRuXYfCO8f6idQ0TuSS6AESzM2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791761065; c=relaxed/simple;
	bh=m3BnwrsBCC4fx6HgcsIF/WVlyi1eQ5XkT/eV2797Vq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKRnsVDRwzzN1bP04llRU4AtpBCZ1wz/I4kVIfbjGAFs71MQXvFRQzeKy/tM1CMBXbpuQnRiG7N1MzknIUEjCAfNcsWjCAw4d/iPJvP3PQeL9f+MjpVQq2iJuVPRMvZQQtw0VoQYBkOHxZHzkM6wxsCA9MmGtEYFX3SawyJDNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz; spf=pass smtp.mailfrom=gamesplit.cz; dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b=PgFwjlni; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gamesplit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gamesplit.cz header.i=@gamesplit.cz header.b="PgFwjlni"
X-Envelope-To: regressions@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=m3BnwrsBCC4fx6HgcsIF/WVlyi1eQ5XkT/eV2797Vq0=;
 c=simple/simple; d=gamesplit.cz;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791761056; v=1; x=1792365856;
 b=PgFwjlniIPxc5fdT2+g4rWmjHWsdcOHr16R3vo+Qoe1YnvO3qzF2g8rAyeQcLpA9ytvXhUgm
 yNzErdrTtFObfjBbd/ahd0stkkUg8NdxpVY4qtSYFyxLTAeWQpW9dPc3mDA173TzdbwfegZ7GQl
 MpDrt7tRzTilIgJoJRTJpafIDZ04q5KvIfRz+zbwwesJ5+UEUv71UFVbHLL9YL6u99vtZ3hcuxl
 ACqzRW9QXFxt2W3S8hDswlgYL4gNwk2CRoL4/iTtGAlV7c5jCC2g+9xgaKZcJFYWyusEV0lMS+k
 IN3QNYqmNK40bNuuoMZPb21zfq29eW5souFMzx/G/ysgg==
X-Envelope-To: regressions@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5c0e0f3868ab07ac;
	Sun, 11 Oct 2026 23:24:16 +0000
X-Mizu-Trace-ID: 5c0e0f3868ab07ac
X-Migadu-Flow: FLOW_OUT
Message-ID: <787cd8e0-d0f4-46c2-96ce-3920cffecc2a@gamesplit.cz>
Date: Mon, 12 Oct 2026 01:24:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks
 hi-res wheel scrolling over Lightspeed receiver (G903)
Content-Language: en-MW
To: Lauri Saurus <saurla@saurla.com>
Cc: Jiri Kosina <jikos@kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "jkosina@suse.com" <jkosina@suse.com>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz>
 <pI2--urSOUMdyRKpMPDftneDAGdGm05IPF8Xt8FhYnOLhbErUDQRh_6Yq1wqKW6559W2APlI2QtM03TJOrjRobiIoUSsMOrutYfyZP0W3OY=@saurla.com>
 <dfbc41ec-7200-4178-9bc2-a8b4d6b9654e@gamesplit.cz>
 <Qcqpyk51pmEh4pab4ob63O_xwOfVnMZbRigEHshfaClUdXYlQgHvsdGqCqGyI8o8XctHqVSDpoTW5Ngsyz03wlX9ghiv8dpLREphQW8Gppg=@saurla.com>
 <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz>
 <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com>
 <cb961991-b746-4f8f-bb76-c597b35a908b@gamesplit.cz>
 <pFprW5RFjs9iH705M5zdueiM6SNAbThCFeYaiQxtN2yUUCdthyn0YY0ZZGdbQFMIbR598puKKBU0E3X6pEwMPpiczEO8pk1vayojyY6EEwM=@saurla.com>
 <20954143-d35e-4d08-8e9e-1a7be0ff2343@gamesplit.cz>
 <s3TGXgN0OxCsL9qEsHjcTAFxET86V72Zbk3JlqOByNHJrfX8MbSfi-MxH6yP_JYXEtV1_7EmqZMQU8xaRG8PEZmRTrNGvLZV7RsrFbxIfPQ=@saurla.com>
From: Frantisek Musil <lister@gamesplit.cz>
In-Reply-To: <s3TGXgN0OxCsL9qEsHjcTAFxET86V72Zbk3JlqOByNHJrfX8MbSfi-MxH6yP_JYXEtV1_7EmqZMQU8xaRG8PEZmRTrNGvLZV7RsrFbxIfPQ=@saurla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lauri,

> To me this sounds like you might have the scrolling speed set too high at the desktop/compositor/browser side? This would explain why commit f0866517be93 made the lo-res feel too fast also.

You were right, and I'm sorry for all the noise - this was not a kernel 
bug at all.

Root cause: in my KDE config (~/.config/kcminputrc) there was an 
explicit per-device override:

   [Libinput][1133][16519][Logitech G903 LS]
   ScrollFactor=7

It was almost certainly something I set myself months ago, back on 
Fedora 42/43, to compensate for the old kernel bug you described - where 
low-res mode only sent one REL_WHEEL_HI_RES event of value 15 per click 
instead of 120, making low-res feel extremely slow. Cranking the desktop 
multiplier to 7x made that old, genuinely slow low-res usable again at 
the time.

Once commit f0866517be93 fixed low-res to correctly send the full 
120-equivalent per click (matching hi-res), that leftover 7x multiplier 
was still there - so now BOTH hi-res and low-res get multiplied by 7, 
which is what made everything feel "extremely fast" on my system. 
Nothing to do with your commit being wrong; it was doing exactly what it 
should.

I reset ScrollFactor to 1 (default) and scrolling is now correct in both 
hi-res and low-res, on the stock kernel, no reverts or patches needed. 
Also confirmed with a clean VM (default desktop, no
ScrollFactor override) that scrolling was fine there the whole time, on 
both old and new kernels - which is what first made me suspect a local 
config issue rather than a kernel regression.

Sorry for the wild goose chase, and thanks a lot for the time you put 
into this, especially writing the debug patch and buying a G903 to test 
with yourself.

I've got a handful of other Logitech mice lying around too, so if you 
ever need testing on hidpp wheel behavior on different models, happy to 
help out.

Frantisek
