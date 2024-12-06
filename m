Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4941B14A635
	for <regressions@lists.linux.dev>; Fri,  6 Dec 2024 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452163; cv=none; b=eNi60JdULNq9gskRJ0hvxKya824RyyQlbDOtx7gsOPGwvKdHShsWB6CTnwo1Hk304qNC1wBwU9u2p91Wt0pH9JUpmYNotKdstRW7X0Yilgiy2RhxhXywByDH9A4LsML9tr/lyEDy2cG/O7sabhWnLOLqbbbNVGE13lC5XfSPIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452163; c=relaxed/simple;
	bh=dZRT2fcSHjnMoU6qnGBH964/9Ps4VyIHK7kAxlb3RMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ML5GcSluAsgEjdxoMxWyBYolKPMPD6u4sWu4CeMqC8lLVzbD3DgTJ1HBK+MbR6rGW4rRFhfDlWxMgrjxE0hIqCbbjaQXL8lxjp+KnXnVD5GtIFAVjxJWiy5fcPDjnTlVtCkPn6FoyRacNaU8P84jrTJyGJ7rS3bb3F6zJ/t3cTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5Xtg/7+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5Xtg/7+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1156445a91.1
        for <regressions@lists.linux.dev>; Thu, 05 Dec 2024 18:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733452161; x=1734056961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTd3s3aluN78Fp6JU1KrhtNeKWaky7LzzZMIynAmPTU=;
        b=a5Xtg/7+jFoEOJgUXsi2wkFKqc+vWp5Ecc0NYfXcamIQbhXRBYyCJM4Sn+Vn4VuSeG
         YPrcOvsbN7RxksaT2/gl34Itj5xE8aPV4GxxJHMmF4UVdywj0L4PnFXueUaMkOhEr1gA
         uvow2W94bIFmVnpbsvpMu7a1+OZXDWyFVtFzL/Fiz6O/ML/ZZ1Vs1AstuAzle7I3TQf+
         VGcHwe+B65iLmAgvM3eknz0u8Y9dIwswssDE2MVrjSdfuvunShAtbUPwdRiqucabiA/R
         Tl+OeTTEkw/ZAE0FygQwpL2la4xGmdjO+r0UG7CLZYnWKKknUkzBv6pJrKWm1TpBVikA
         i/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733452161; x=1734056961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTd3s3aluN78Fp6JU1KrhtNeKWaky7LzzZMIynAmPTU=;
        b=OBTTHduXdYBP8tQcN7r7YB9AXmQ1oph3zwBWEBHOSQP+Mej5uwyRUxA3Mjcc0zzHEa
         /lrDFE8ipmVhodj+WtXpbwizogrJZ9PBfUHRdM+jOYc8xDdx2Atb0iMPu21zOLKzMPj2
         U0paU0WggR88rYv9wYWLNaTuYHgdqtYORmFfYMTs84+MdBxzws+mhlluS2qAdyOjV1wf
         qfnH24jxkUdZPAyLc+Lct6zrhiaXOJl4EK10bXgu4LPHL6Nh2cOu45fyEW080V9QkB6j
         5rzivAkxzx58BiyFluvNj50Dnby2inqaemXDhkRRma0qAjHSmnPsp2A9TrMFoGbfUi0O
         w7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU9C2coFRlIN8mTW3r7UdokPpZIHg/YVjKHlSyxStGVmS2TbbFtsAU7CLQCu8hqLjxxZuAkI3ghn6FDAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlrhgdWarv5uBm65e5V/Ir5bTvgKM/OFyCxpoysXXpw3TzqOFe
	gvL7+k3YhGtPKfUeV8c8XpGM0LpX03nAUWH9//W8bPMpIIZB5BOI
X-Gm-Gg: ASbGncu9SoBMJrBl/B9AWPnTt9fFctRoXM4njGqiMjL6e2AjgjTf4h6ZMZmGcAGEClf
	V8OZuKba25S+h3CigF9QzwlrrTQZTxsQIa/Xqq0Vr0ZJoXXPOaDuMtLNa88+TSGdK5zUzHFNy84
	Hy4dr0MXJyS9Joegl9IoQTomuhI2zOdoxMQK0lPtfCqe8HzXqjX+qpc0fwKj6HonJTrepwBFoQM
	QOJYMc2LNYK0Vi3jySb00bZlxTMHiBeWcixXtAAYDjUsaeowVRcLjAEHqaFDcMaFABQjGhtAXqU
	uBa700b4
X-Google-Smtp-Source: AGHT+IENADZamiqnBlD27UzquN0EcS+uEssM9SmnMSUyaY3tEGzNq20fxMu9PeMax023yYnyI0hAAA==
X-Received: by 2002:a17:90b:254b:b0:2ee:fd53:2b03 with SMTP id 98e67ed59e1d1-2ef6aadb46dmr2207449a91.25.1733452161282;
        Thu, 05 Dec 2024 18:29:21 -0800 (PST)
Received: from amdora.. (c-76-146-136-228.hsd1.wa.comcast.net. [76.146.136.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eeffcdd432sm3180613a91.2.2024.12.05.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 18:29:20 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: sergio.callegari@gmail.com
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	jglotzer@gmail.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate
Date: Thu,  5 Dec 2024 18:29:19 -0800
Message-ID: <20241206022919.183292-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
References: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sergio,

My apologies, I neglected to mention that my setup is PCI, and not USB.

It's an AMD Ryzen 5 7600 CPU on a PRO B650M-A Wifi motherboard. For completeness OS is Fedora 40
with any kernel starting with 6.11.x.

    $ lspci | grep MEDIATEK
    0c:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter

    $lshw -C Network
       ...
      *-network
           description: Wireless interface
           product: MT7922 802.11ax PCI Express Wireless Network Adapter
           vendor: MEDIATEK Corp.
           physical id: 0
           bus info: pci@0000:0c:00.0
           logical name: wlp12s0
           version: 00
           serial: 0e:80:32:35:2c:9b
           width: 64 bits
           clock: 33MHz
           capabilities: bus_master cap_list ethernet physical wireless
           configuration: broadcast=yes driver=mt7921e driverversion=6.11.10-200.fc40.x86_64 firmware=____000000-20240716163327
           ip=192.168.139.211 latency=0 link=yes multicast=yes wireless=IEEE 802.11
           resources: iomemory:fc0-fbf irq:103 memory:fcf0300000-fcf03fffff memory:f6c00000-f6c07fff

What I am struggling to understand is given how easy this issue is to reproduce -  an AMD CPU, Mediatek MT7922 wifi/bluetooth chip,
and a 6.11 kernel, you suspend, and then wake up, kernel panics -  I would have thought that the interested parties would
make this a priority.

I think that a logical first step would be for SW owners to confirm (or deny) the anomalous behavior.

Thanks,

John

