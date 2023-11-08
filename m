Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D18374C8
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="H92kEDGF"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2D303828552F;
	Wed,  8 Nov 2023 16:15:31 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id O16yaPNJgcEL; Wed,  8 Nov 2023 16:15:29 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 21DAD8285980;
	Wed,  8 Nov 2023 16:15:29 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 21DAD8285980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699481729; bh=McOllh9U7izGSTvvGXIa5AO9vWQUveTCmbtFftv2mtI=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=H92kEDGFjItFJAvAZkV7OwUUWs8/ElNVAHnIRY9VmeARJe00UjpCudvt78iV/r24k
	 p2vvhRI6TY/ztyAhTG1A6ILvLGL1ajzIwohh8cvH6/Mr8MOlDUW14NB12K5O+IcGvS
	 pTjUKuxBFEHlCrv/01+EI+3UVpUR/fQibmouERxE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ixu_ybQG4Fft; Wed,  8 Nov 2023 16:15:28 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B4DED828552F;
	Wed,  8 Nov 2023 16:15:28 -0600 (CST)
Date: Wed, 8 Nov 2023 16:15:26 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <262637196.45862863.1699481726721.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <716eb4a2-94c4-4da9-b1ed-b94858e3ee08@kernel.dk> <1449911021.45817655.1699465215683.JavaMail.zimbra@raptorengineeringinc.com> <74d15590-3af6-40ed-8d3b-5bf8cd3881a5@kernel.dk> <217080ad-adb4-4cbd-ae91-1287bb6a5400@kernel.dk> <410961969.45826785.1699468561883.JavaMail.zimbra@raptorengineeringinc.com> <2225dc79-37ec-4239-b13a-ac444bfa6a6b@kernel.dk> <3f2dcaba-d18e-4d1d-9b96-2a168f550881@kernel.dk>
Subject: Re: Regression in io_uring, leading to data corruption
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: Regression in io_uring, leading to data corruption
Thread-Index: vs2p4m/2HS+9Kj0aavhD7lCBNfHhRg==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Wednesday, November 8, 2023 4:05:50 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> On 11/8/23 12:06 PM, Jens Axboe wrote:
>>> I have been giving some thought to the CPU pinning of the workers, and
>>> one thing that may have been overlooked is that this could potentially
>>> force-serialize worker operations.  Did you just have to pin the io
>>> workers or did the workqueue also need to be pinned for the corruption
>>> to disappear?
>> 
>> Not sure I follow, the workers ARE the workqueue. For the pinning, I
>> just made sure that the workers are on the same CPU. I honestly don't
>> remember all the details there outside of what I can read back from the
>> emails I sent, it's been a while. My suspicion back then was that it was
>> some weird ppc cache aliasing effect with the copy into kernel memory
>> happening on cpu X, and then we immediately punt it to cpu Y for
>> processing.
> 
> You could try something like this, though I still need to verify that we
> never end up running it on the wrong CPU. But may be worth a shot, for
> debug purposes.

Getting a bunch of:

[   25.268005] work cpu 5, me 23
[   25.269217] work cpu 5, me 23
[   25.269804] work cpu 5, me 23
[   25.269914] work cpu 5, me 23
[   25.306967] work cpu 22, me 41
[   25.308821] work cpu 22, me 41
[   25.310461] work cpu 22, me 39
[   25.310975] work cpu 22, me 39
[   25.310995] work cpu 39, me 41
[   25.311001] work cpu 39, me 22
[   25.313916] work cpu 39, me 22
[   25.320227] work cpu 39, me 22
[   25.328760] work cpu 33, me 39
[   25.331756] work cpu 33, me 39
[   28.159191] work cpu 27, me 39
[   28.160456] work cpu 27, me 39
[   28.160511] work cpu 27, me 39
[   28.160998] work cpu 39, me 27
[   28.162042] work cpu 39, me 27
[   34.422210] work cpu 0, me 17
[   34.423543] work cpu 0, me 17
[   38.144123] work cpu 14, me 8
[   38.144284] work cpu 14, me 8
[   38.146765] work cpu 14, me 8
[   38.146884] work cpu 14, me 8
[   38.148067] work cpu 14, me 8
[   38.154664] work cpu 14, me 8
[   38.159555] work cpu 35, me 14
[   38.159752] work cpu 35, me 14
[   38.161737] work cpu 35, me 14
[   38.162896] work cpu 35, me 8
[   38.164669] work cpu 35, me 14
[   38.167428] work cpu 35, me 14
[   38.167549] work cpu 35, me 14
[   38.169941] work cpu 35, me 14
[   38.170002] work cpu 35, me 14
[   38.175143] work cpu 35, me 14
[   41.859077] work cpu 5, me 28
[   41.859918] work cpu 5, me 28
[   41.860819] work cpu 28, me 5
[   41.862670] work cpu 28, me 5
[   41.864077] work cpu 28, me 5
[   41.867216] work cpu 28, me 5
[   41.867375] work cpu 28, me 5
[   41.873102] work cpu 28, me 5
[   41.879452] work cpu 28, me 5
[   49.012472] work cpu 5, me 26
[   49.014336] work cpu 5, me 26
[   49.015319] work cpu 5, me 26
[   62.911760] work cpu 18, me 0
[   62.913764] work cpu 18, me 0
[   62.915512] work cpu 22, me 18
[   62.917665] work cpu 22, me 18
[   62.917959] work cpu 22, me 0
[   70.677984] work cpu 20, me 2
[   70.679304] work cpu 20, me 2
[   70.679375] work cpu 20, me 2
[   70.682036] work cpu 20, me 2
[   70.684209] work cpu 2, me 20
[   70.685511] work cpu 2, me 20
[   70.686503] work cpu 2, me 20
[   74.446195] work cpu 7, me 2
[   74.446473] work cpu 7, me 2
[   74.448095] work cpu 7, me 2
[   74.457561] work cpu 7, me 2
[   74.471382] work cpu 25, me 7
[   74.471970] work cpu 25, me 7
[   74.474480] work cpu 25, me 7
[   77.486199] work cpu 33, me 3
[   77.488119] work cpu 33, me 3
[   77.551875] work cpu 33, me 5
[   77.553058] work cpu 5, me 33
[   77.554057] work cpu 5, me 33
[   77.555447] work cpu 5, me 33
[   87.688015] work cpu 11, me 26
[   87.738868] work cpu 2, me 23
[   87.740051] work cpu 2, me 23
[   87.740298] work cpu 23, me 2
[   87.741811] work cpu 23, me 2
[   90.848175] work cpu 34, me 1
[   90.848866] work cpu 34, me 1
[   90.850100] work cpu 34, me 1
[   90.852995] work cpu 34, me 1
[   94.206858] work cpu 26, me 32
[   94.207193] work cpu 26, me 32
[   94.212528] work cpu 38, me 26
[   94.213082] work cpu 38, me 26
[  101.536345] work cpu 36, me 7
[  101.537108] work cpu 36, me 7
[  101.538528] work cpu 36, me 7
[  101.538710] work cpu 36, me 7
[  101.539628] work cpu 36, me 7
[  101.541145] work cpu 36, me 7
[  101.543162] work cpu 36, me 7
[  101.543241] work cpu 36, me 7
[  101.545231] work cpu 26, me 7
[  101.545292] work cpu 26, me 7
[  101.546434] work cpu 26, me 7
[  101.547094] work cpu 26, me 7
[  101.547408] work cpu 26, me 7
[  101.548091] work cpu 26, me 36
[  104.732140] work cpu 4, me 26
[  104.732518] work cpu 4, me 26
[  104.734766] work cpu 4, me 26
[  104.734877] work cpu 4, me 26
[  104.736113] work cpu 4, me 26
[  104.736401] work cpu 4, me 26
[  107.962200] work cpu 3, me 4
[  107.962338] work cpu 3, me 4
[  107.963646] work cpu 3, me 4
[  107.963752] work cpu 3, me 4
[  107.965676] work cpu 3, me 4
[  107.966404] work cpu 3, me 4
[  107.967589] work cpu 3, me 4
[  107.967638] work cpu 3, me 4
[  107.970517] work cpu 13, me 3
[  107.973168] work cpu 13, me 4
[  107.975058] work cpu 13, me 4
[  107.975133] work cpu 13, me 4
[  107.977069] work cpu 13, me 3
[  107.977617] work cpu 13, me 4
[  107.979458] work cpu 13, me 4
[  107.980097] work cpu 13, me 4
[  107.980746] work cpu 13, me 4
[  107.982719] work cpu 13, me 4
[  107.983298] work cpu 13, me 4
[  107.984179] work cpu 13, me 3
[  107.986206] work cpu 13, me 4
[  107.987192] work cpu 27, me 13
[  107.988974] work cpu 27, me 13
[  107.990738] work cpu 27, me 13
[  107.991316] work cpu 27, me 13
[  107.991608] work cpu 27, me 4
[  107.992647] work cpu 27, me 3
[  107.993783] work cpu 27, me 3
[  107.995322] work cpu 27, me 4
[  107.995893] work cpu 27, me 3
[  107.996312] work cpu 27, me 13
[  111.608060] work cpu 2, me 27
[  125.790232] work cpu 37, me 1
[  125.790587] work cpu 37, me 1
[  125.791879] work cpu 37, me 1
[  125.794301] work cpu 37, me 1
[  132.545885] work cpu 22, me 37
[  132.548194] work cpu 22, me 37
[  132.549514] work cpu 22, me 37
[  132.550110] work cpu 22, me 37
[  132.550695] work cpu 22, me 37
[  132.551730] work cpu 22, me 37
[  132.552136] work cpu 22, me 37
[  132.564102] work cpu 31, me 22
[  132.564324] work cpu 31, me 22
[  138.957170] work cpu 29, me 39
[  138.958278] work cpu 29, me 39
[  138.959922] work cpu 29, me 39
[  138.961734] work cpu 29, me 39
[  138.963112] work cpu 37, me 29
[  138.963235] work cpu 37, me 29
[  138.965017] work cpu 37, me 29
[  138.965071] work cpu 37, me 39
[  138.967289] work cpu 37, me 29
[  138.967366] work cpu 37, me 29
[  138.970359] work cpu 37, me 29
[  138.970420] work cpu 37, me 29
[  138.972597] work cpu 29, me 37
[  138.973354] work cpu 29, me 37
[  138.973656] work cpu 29, me 37
[  138.974402] work cpu 29, me 37
[  138.975024] work cpu 29, me 37
[  153.025008] work cpu 32, me 10
[  153.026528] work cpu 32, me 10
[  153.027503] work cpu 32, me 10
[  153.029120] work cpu 32, me 10

They happen both for corrupt and non-corrupt runs.
