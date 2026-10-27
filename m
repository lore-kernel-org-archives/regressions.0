Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106791;
	b=l4Mp7lwovuvIbnrYJU+YMTWktX//rRzHTXeiQ5Tyt9sDyOBti2tcGnQLFzheRMKzG+eF
	 QpfIo8xU57ZGAmIg6g3UhXS8Vq+GBLbkF8QARv10vWS18D6zPuYIifFALXOnpL0nO5rrc
	 kb2REf13tkqae1gOkK+dw8LssJg1XxNnDeFYHF2NdTN3UrjZtXjy3VDIjLYHV+hmL8gpJ
	 5qMFmOwS0UkLDqpHdHcN0EzuJGL+MQ14WCOOc3/uWbSphM7WPgVSpMe5TfsUtisbmiu4Q
	 VrDviF0PLTxBzWKO6sshHwEs58sGuDcggD8ABuWJstm/rlutYlQ2tpvhFzpyTNDKQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
	b=RWC7X7AzGZ36fuwUH46LJ8/tatMtLn/SdXZReFudPEgLm1Q9ptJ1iPwJmjai/58pbO0n
	 v67chKciw2J+Nf+Rj+RTuFqqUyi5+swszaA9c2c1YZ+5UFPNt+9LSyTHToQitcZUf2fhi
	 sL+0mHmyhAb5NZ4dNOAqDlwzu3v2r/JQZZvbwz4P55eF2GA6wZfh82+rPqMRGyrGxHY+J
	 xKAAIVD7HljdTGODNCOr86kmmmMdeiyrzwQqxh1N0ExfEYDYqqHeXGeHGr52X7SdluJve
	 zYTTXMi6/t5gMW3Ldr2JFX4gfMoUQlIPmYcwT/I9v39AQj6SJgTnWL+YbzR0PRm6rCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WAHkZqdH;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FC606A334
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 13:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23FC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WAHkZqdH
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a17a332ecso569592eec.1
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106790; x=1793711590; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=WAHkZqdHy165HIZu7gN9Fh8SNv6AdIACgCAqIKoNZyZZ1GknCQCuH+cjnd1MnLm+NT
         YjNiXLb3ynfdRvPVfr6wErkMTc1NAq2Dxx40L8GbtTmYkerw/asIFdsyIx0+y1iW8DnP
         GBrFDSYUyWDMutMOKEg54X7HSOqSMUyR04s0m6I/u5vY8uRkGl2nxgmXjvmChKq0ia/2
         221OGIVLHofNuxGBkuvg3GSkT0Y/84Oil/9Wvzoi9m6hhzZEoPKBw05A2VDjnCtj3gB0
         PLrn05F1zSg/PdJae8y+HoLExTQqFUrw6jMPuUl4VCbEa0hk6IjkU02ORlXFXi2uG42B
         G6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106790; x=1793711590;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLb4nDnDa6CheKrcmNiCI0BRgJPIlEmNmuOLfa1pfGM=;
        b=lq2nHVphdREFL9aRqt9mu/goaEIFlgv6SdRames21Jt5pKF9Y0ogRUL5HVncZWWoyl
         qEgrPtCZxdcpq/f7iJGrC6uMcp21Wra3ProzHXiYSmwNwnSKrQANmnAFoeL1UEGHkjnv
         8kUTtE4/mPIjIjuj/lNwybIAkv7jADiKAVgnPFLfEzSm1mJmYaeWdNLo3yyQYUYQfIJL
         869zJtEiraLqU5/LIqWh1VmDUFz/ikvDDOewG3jBhC8CjhWYpbblrrkgSskVPxqTcSBN
         BnwIz5GeiQ0DpBr0AQ/b5Sy4abFPd1Q0JdgKMlkj3Rf5Sj7UsNnrj1C4yfItyrJTmTv8
         PVKQ==
X-Forwarded-Encrypted: i=1; AKwUvByLJlS54+gl9Nt5YMByG7JkYcd+TGfSDgOF5MP6+30IZ4SkZZuMdJpNdUIcOQBUfbYXRnidiOizq4Etmg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJWjEz9An4+g3x3pAfWwq6pMVeG1p1hGFIn/vdSpzhByC+8HSxw
	D19tjFXAkehOfspD9aGvm/R6AJBW0VcdmlMocFNr/vw+LSxhBewOqk/s
X-Gm-Gg: AYBFou2KOZcmItvejsUJl3fi5zwe0GYsgqCiVHOp9KOIpYx5//vJlnzw9eXAL9TsL/0
	TM+5p2Xhbifkwz53Trt85R+g5Fhh+OJiUo9ZNGdOTvIQH0MmJS/5e4DElcHPOCbgbfCWWTDNSMz
	/uZsOBzKrzrMIrCoYd6tGRlSwfpqzRB6y1fYaHWTFovKUnCFyDsnD1vH9eZCU+XNU5+fVPIg59m
	xs1gVTJ/0IuoboXHupC48dx3fJm62Tp1pESQRtizAcI8XT1Kc8vi79dM3HwsmNjW0LpHrbsy6ac
	cnAgHc4jh9l9wmkvbypFLZjIXYq2kF0LOsQAeJ7Yn9pMJQQbvzs6JBJtsuaX2/F+qS6i2N0Jq+1
	0M1cAqQs+sXWW407Aqjr6kjL4CrlIaLNVu+BcypoukCvk4mFNu3UO/9wa+SeoM4WdX+ucfcAyhD
	NOUiGb3DmsfBf9F2yZcAWekfX18xNKjackuxOwINV+RyY+fXDjTkvdXGdncgqqE2HYnZqB1oTXv
	rzekdCjBi2J1WmOB91EQv3RY+w+3nFU8PCkASbigdo+1ny59FcGsm/sS+tzgMYYmqaApRQ+zhW9
	PicE/N31jZW9JA0h6Q==
X-Received: by 2002:a05:693c:88c1:10b0:367:5e31:ce29 with SMTP id 5a478bee46e88-369e84fe37emr14011879eec.20.1793106789881;
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a002a486csm19339403eec.22.2026.10.27.06.13.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
Date: Tue, 27 Oct 2026 21:12:52 +0800
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
 netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D438C59D-09D4-4008-9240-18DA0ABBDCEA@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
 <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On 10/27/26 1:45 PM, Jiayuan Chen wrote:
> This precondition does all the work. The server only learns the PMTU
> when it sends a full-size segment itself. [...]
>
> Please re-run the 6.12.107 case without seeding the PMTU.

You are right. Without seeding, 6.12.107 stalls the same way:

  kernel        PMTU seeded   SYN-ACK MSS   1 MB upload
  6.12.107      no            1460          stalls
  6.12.107      yes (ping)    1416          OK

My reproducer took a shortcut there. What it should have modelled is
our production setup, which is the masquerading relay you describe:
the clients share the relay's address, so ordinary downloads by other
clients keep the server's PMTU entry fresh. Modelling that directly,
with no artificial seeding (cliA downloads 1 MB, then cliB, behind a
firewall dropping frag-needed, uploads 1 MB through the same relay):

  kernel        SYN-ACK MSS to cliB   cliB upload
  6.12.107      1416                  OK
  6.12.111      1460                  stalls

So I agree it was never a designed mechanism, it is the side effect
Eric describes. We have since added MSS clamping on our relays.

If it helps, I can send a v2 that describes the masquerading case
instead of the seeded one in the changelog. And I am happy to test
the net-next follow-up on this setup.

Thanks,
Esko

