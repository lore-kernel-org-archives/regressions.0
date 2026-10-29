Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277413;
	b=1zN6vcxUxwWOHw4sGnnAidhQ34DWBqH+k5JP74gw/YR9Zwt7djzVYDIULpE33kHZYqo6
	 XQBQ7JkV7JcgSrVWz5LGl+f/xcOyRCGCZ6vWLW5AUql5Y/A5VWaml8qTGb0IzDjV1/opt
	 WltQtQ2O3c5oHt7lOBLdFgdT5T69g1udc5pCphpjNXdHR7D2H7UyAhJqPpIEZX3QxX3d5
	 Ssddea83CIlFIm5MncKAai2iHrEKjq069CY98S8YOTr9nSnl11ZsimL6iI9Uv02dN3s50
	 bJ2PYwQVzY4TM8qaMKot7JfD3f/Vigjp13DYpfiAc+hLKHBfp3QRmOWXHalJX2/phxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
	b=4qc/A/nZsblgtEpCxnpb0SuZs8DG96CpZHbz2AAArKLT842gG11E3QgFfGpLISvt2Evi
	 Cvxvl+AdWq+k/jotuLTbCCuM4GaIfMSmgAWkzTFAy3TAqEdZxKGdqLFG6wxTxgRSD+2VN
	 1rBJQoXABYr0LIC4BIHL26lpo/gb6wtX+/PFT14akG+NqcXuWFQ9mx1TiWsC26BN+GI6L
	 1ICwS7gHfg46Q5rmxKls0AyF1nyGe1GE5Q9/F38HJQ7NbBvmWkS6jatZuGljE1CYoRKIS
	 EGJGK0HJDX6RaBueJqvsq8slvEUNEGzyUlMQfnNWryEXd9Djt0mSyiCmRalk5eDP81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9eSswp0;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90360A2600
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 12:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B90360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s9eSswp0
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso794804a12.3
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793277412; x=1793882212; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=s9eSswp0kxA4IVfjTQCl7gS1pyCp6Fpz0CYXsi8oAWMh8bw6ok4JV+8kD0jPt6Rg3n
         /oP/GbpLMhoqou0l/vwN05SJ035RPGdGEu86z+Yuhk68hJm3ggvsvgCcuhCJvHru53OL
         sDTlk/LtdJfJLKvIwQcRzfbWDANZIc3bUfCL9iHnVrZEgcv5lnOZPomR7kK6HkkIyLfE
         P6ATzJ8SjDXNsfIP5VbJsCnRQzZqUWr+P/uIPXaXzp9utCSOVI9v1gBSpe6s65QJjwSG
         2NP7qpfn86PdirGKMpy7/c5wbyLAiIySwSPjqF6jdKuG9+93CcMqJt08rQZO5c5Q9Ya3
         0/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793277412; x=1793882212;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmc/RolTYy7SeBRxKLMjWzilnvA83GevNb7ysMoswG4=;
        b=C8cVPgvA3Kxad00asXvmZL5/9F7YX1fjf6pkA0wa8pcZIlQKuIIoCXNHohS4dhljXM
         v0FJtcsNaIPDo0ccfMzsa8M04QQUhNFP2cTg0cOtZ2UyFZBye7QTdsIcClKrMk6Envrf
         T2Ggtf/s/kYngBhdbCHBoMdW1aJJW1AKMBXLYQBvUB0K6jqdSAsb5bt7ysUWFTOomW+/
         Vt6de7pQim/IW85hd9/uY5L8KOIVRn8a1lXmPA5D8AisM6p9qa22I9Zqtl8Yf+a60/yG
         0AAYHxzxTVp/eytBdKuUQegjWo0eWqRed7AU7E3ba5I+Ch1QxSPBd0UYp0eh8S4Kd6bn
         b6+g==
X-Forwarded-Encrypted: i=1; AKwUvBxfIUwezAyd1IyeY+7qzLneIMZcEj76bmT8KBiW9z69jn+m8SMPzpQpfl0du0QPOYnOpsdwDsE/LeyUuQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLlQBPWa2V2iv2f3SyrP6lYqKxNWOXw2IYo9SZ8sifXXZJx2FIQ
	/5VRBdPHHwEMl/9pA1s3Ngwn687tpHnEgWlTt4VMwgZLB3u5GCo0fjjW
X-Gm-Gg: AYBFou0TuMrvA+rO/p4FZHoQ1FXjLjAyX5JoJkC+1RZ1HTOyuHVv2ekWDvqW2I6o8sV
	Bxb+xfjL0+5W3npLc0CgBJAKHEb6Cb+ulNWGEuTRWeKtFAHytPG2oHEav2Zx6M/KMMVQyEa510W
	UOR+JUgLu66+c+9RqOSw8masr7B9nJK//5J2JKL5Y7GNwYkbeUHFvfREGBvaarSnoz2XC1+teCv
	QLHOL0SrQiYdIqWkQjgOE8e/l9du/EikJSYvJkzqgrIHOaWu0eyg4HCr2l3PHFZKLqhhfzMQ3hL
	1TCv9Egg4XhZcv4xyT+zv32i/SQmKpJxyDOa+0SnYAbzcqouGcrKuZKe7JWk3g78qMqzbHbdL9n
	1Yhru5QlrknAbvTKwX6jUhTehgr/sN8y6yGRkgXBTAbwTmXSDwXay/YASdjVCocLbOQW/9d7Ojn
	/pFiMtu5inMKZXi640i0Plpe0F4z5y9YBUczfzhdrxh7xqyipu/uQYSzprHIGzrqCfLftxP13Ec
	ma29VIvRydspupfEe6YI/1q1QGIdSZfIK90O8pdNt0LfE1OrejXpH5rmN8zw5mpa+Iv+jOcxP08
	H4tAveUkke3wpMqO2ge1eScuVg9FZ9zD8xhG9r6lo4/RulmJadAF4Kyw+RqNPWO5br0=
X-Received: by 2002:a05:6a21:8804:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3e9023ed955mr3933798637.65.1793277411671;
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc46482sm5225375a12.11.2026.10.29.05.36.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:36:51 -0700 (PDT)
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
In-Reply-To: <20261029112045.5e7d4317@pumpkin>
Date: Thu, 29 Oct 2026 20:36:33 +0800
Cc: netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 regressions@lists.linux.dev,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <40993B2C-6390-4BC6-B4AD-967518B0CBE9@gmail.com>
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com>
 <20261029101859.6893f1a0@pumpkin>
 <22077B76-12B0-4DD6-813E-A3968003575F@gmail.com>
 <20261029112045.5e7d4317@pumpkin>
To: David Laight <david.laight.linux@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)

On Thu, 29 Oct 2026, David Laight wrote:
> But that relies on something having gone the other way first.
> In general that won't be true.

Agreed, that is the same point Jiayuan made.

> It is almost worth implement something that retries with the shorter mtu
> to detect the PPPoE mtu blackhole at the sending end.

Linux already has this: net.ipv4.tcp_mtu_probing (RFC 4821). With it
set to 1, once the retransmission timeouts reach tcp_retries1 the
connection drops to tcp_base_mss and probes up from there. It is off
by default, and the same goes for Windows (EnablePMTUBHDetect); macOS
turns it on by default.

> Or even just use the shorter mtu for long RTT connections.

Both of these have to happen at the sending end, which in my case is
the client (it is an upload), so the server can't help. The only lever
the server has is the MSS it advertises in the SYN-ACK, and it has no
RTT sample at that point. For now the MSS is clamped on the path.

While reading this code I noticed there are no selftests for the black
hole detection or for MTU probing. I'd like to add packetdrill tests
for both once net-next reopens.

Thanks,
Yongjian
