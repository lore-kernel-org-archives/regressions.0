Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0272877E8
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981442; cv=none; b=raV4hMQIWyk7AdhJuAbpRgh2t6wqBgVghTHrOkW7O7HC11PvCUCdGcTjD6aeAMvevNd6z/NmcE1Ymq0uZNll+suzRA/7PxfBogoEqUErX4r09RLqKTdx1eerlIxJGD6vc3isJppVoS5aM8kZ7ChjCCXfEfmG3rumjeoAXP1XC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981442; c=relaxed/simple;
	bh=RxMAVPYvLm9d64Z46gYq8gZJC2i5VQst4Y/8fPuNN2A=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=Dkg8k6Muxu5XnETROjCm91+9ht/RZohtOp1naV+9+G0gqGWuULyEwFAdr7OcR5lBrjVq31s3kGtTzoOugvbJVY43opdQqd3ljZprkaF55btXPMPo89gtTDhr3XzqcRk5Xvyu3KIP3PxQVp7hIBetCyU84QpPzw2C/Ih99njEM0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yz6+i9RR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yz6+i9RR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779981440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Xe8uR1i55aaj4N/KTZ7B1f4vHthtQ3hEmvwye2pZI=;
	b=Yz6+i9RR+bJ75HeP4bf86nCFsrNXM8CaGfsI7S4W+a2QQzA5+qol1JyXs0VyOX+Jj+xPkR
	X3pbFrVu9JAtVc09iA/JGAp1+DGTPDdUl3nDDg2lN6EaO9A6pLIRSl25fM7B1l3my1J0K7
	V4OWAE+MVeeYD7lD1bk43hRHwh1ux/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-e5RZ1MLaNemzyN6A0tN8eA-1; Thu, 28 May 2026 11:17:15 -0400
X-MC-Unique: e5RZ1MLaNemzyN6A0tN8eA-1
X-Mimecast-MFC-AGG-ID: e5RZ1MLaNemzyN6A0tN8eA_1779981434
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45eec2badc4so385306f8f.2
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 08:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981434; x=1780586234;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+Xe8uR1i55aaj4N/KTZ7B1f4vHthtQ3hEmvwye2pZI=;
        b=AI6CzbUCEWifT3Y6zZcCx7Iznt7T+9wCKgSbvwcoHEoCOnZKrL3QBNifFWNyUZQAfz
         H9+X/qgAHkitAEr3M2gfhf5YJXAw8XXMda3G61dP95o19FRH49sjbGl3jFK0yMH1Qprk
         o7Dv3Z0gPI0C2YMI59QtTcTdeMLvnUd6aMw4S0nqvEzh7To/d1JHiPfqnDCQd5zLH70l
         QjagJqmZM0O+IGQVfqbpAmjDJkKVjq7RtV1rVHGsKdty1XWeZqwlUuyDTSWYRN6n95+N
         /IPfiIMHSN7M5/CYbWcYsXMzJFTISSH0OjdFrCBx8tmonrPrt8Uwx/N36p56OYHnXDvt
         0XDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QxcaB6diSBRWk7XfiiwH2Zv3rJwxYORbsVn0R5YV4emJdHv4muXQbANlCQKvtYwCvxr//STcDfe0+Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqpuNCcT8Y7pXtqlJrqL0S9J8h3dwXD5ZoXJJ3qioCzi1a0suO
	pc3PyO99Tn0UZ5UYsCaIIuf2BizPT2Pxi0BD849w4yLc4I+CgqnPndCrelR/JobMYMux2kTOtyk
	tI2vBxYkQCwGBm88AP6xZqmhJi+WHtTUTKPgQeiVYpHEK6MRdB66blnsmWJWbD9Jm
X-Gm-Gg: Acq92OG6Tg85sntXJ5SF7kXPbXyXPXpY9XnloTqew7F4kEXwXAsGtwH5hFs5Cko1thr
	MsVYQHABTxs2HlOB25QLTFZcBs4ViFAsBehMns1y70uTYrpYPfbf1spWfuwN19hAYb6J5udc/hG
	LNgGD4yN9xb4wK2INu/tZ/rJnsZshflf594rzIGEG32UzTLsvpSqB1/en4FPNHZwar/rSg5LBkw
	AMVNYQ8EBgBTIyFo54NgFE8BRcM+zaoRNkVJ+GrgEoy05+iN04hL1+gEVIBGinqZAkygTRQj9LY
	LGLYgxr056tn6/+mOsMPG1Tvz8/2/UN9ViuZD9OvypvDD3hws/A0tepdeppTl6t7gLiuv8i7rxg
	TDUcmA0ZPcAuAykMrp7Zlq4tsAQAl1cw+Ai4dOKQ3jpo=
X-Received: by 2002:a5d:59c6:0:b0:44a:8c10:40d9 with SMTP id ffacd0b85a97d-45eb39e1ec3mr44591757f8f.23.1779981433850;
        Thu, 28 May 2026 08:17:13 -0700 (PDT)
X-Received: by 2002:a5d:59c6:0:b0:44a:8c10:40d9 with SMTP id ffacd0b85a97d-45eb39e1ec3mr44591674f8f.23.1779981433282;
        Thu, 28 May 2026 08:17:13 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c1e59sm13069697f8f.33.2026.05.28.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:17:12 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Fernando Fernandez
 Mancera <fmancera@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Yumei Huang <yuhuang@redhat.com>, Ido Schimmel
 <idosch@idosch.org>, Justin Iurman <justin.iurman@gmail.com>, David Ahern
 <dsahern@kernel.org>, David Gibson <david@gibson.dropbear.id.au>,
 ihuguet@redhat.com, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260528171710.1a5f6b6b@elisabeth>
In-Reply-To: <178a1a95-65bd-475b-a035-c4ebdc5ec325@lunn.ch>
References: <20260527010641.GA21073@cmadams.net>
	<20260526183122.348e44e7@kernel.org>
	<20260527215135.GB16443@cmadams.net>
	<675083b4-e015-4ff3-836c-798e0a971194@suse.de>
	<20260528073849.759da84a@elisabeth>
	<baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
	<20260528131250.1352ab48@elisabeth>
	<b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
	<bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
	<20260528153202.14900687@elisabeth>
	<178a1a95-65bd-475b-a035-c4ebdc5ec325@lunn.ch>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 28 May 2026 17:17:11 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KKgxjB-MfmidTxptjX8IB-k-TUQcjZ1J99M8WHBuTCI_1779981434
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 May 2026 16:34:02 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > Actually, an eventually fixed version of NetworkManager doesn't need to
> > know the behaviour of the kernel: it can just order addresses by
> > timestamps instead, as Fernando mentioned.  
> 
> Can pasta also use this scheme to order the addresses? Is there a way
> pasta can be independent of the order?

pasta itself doesn't even care, it just inserts (copies) addresses one
by one as returned. The kernel cares, because it preferentially picks
the first one, as stored, within a given scope.

The problem is that they are inserted in the opposite order than one
would expect (that is, opposite to what's used by the kernel to select
them, and opposite to what's done for IPv4).

This (with an older kernel version) is quite "funny" (pasta by default
copies everything it finds to the inner namespace):

---
$ pasta -6 -Ix --no-ra
# ip a a fd00::1 dev x
# ip a a fd43::1 dev x
# ip a a 2620::1 dev x
# ip link set dev x up
# ip a s x
2: x: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 86:de:6b:53:5c:05 brd ff:ff:ff:ff:ff:ff
    inet6 2620::1/128 scope global tentative 
       valid_lft forever preferred_lft forever
    inet6 fd43::1/128 scope global tentative 
       valid_lft forever preferred_lft forever
    inet6 fd00::1/128 scope global tentative 
       valid_lft forever preferred_lft forever
# pasta -6 --config-net --no-ra
# ip a s x scope global
2: x: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 65520 qdisc fq_codel state UNKNOWN group default qlen 1000
    link/ether 32:d4:5b:f0:fd:50 brd ff:ff:ff:ff:ff:ff
    inet6 fd00::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
    inet6 fd43::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
    inet6 2620::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
# pasta -6 --config-net --no-ra
# ip a s x scope global
2: x: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 65520 qdisc fq_codel state UNKNOWN group default qlen 1000
    link/ether 1a:ed:4a:27:f6:9f brd ff:ff:ff:ff:ff:ff
    inet6 2620::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
    inet6 fd43::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
    inet6 fd00::1/128 scope global nodad 
       valid_lft forever preferred_lft forever
---

...at every level of namespacing, the order is swapped. Note that
iproute2 also reports them in the order they're sent over netlink.

> Maybe we should just make the order random, so equally breaking
> everybody, and pushing user space to not assume any order :-)

The thing is... the kernel assumes the order. :) But it also has to.

-- 
Stefano

