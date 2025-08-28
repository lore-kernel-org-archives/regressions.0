Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC82EA741
	for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371116; cv=none; b=imOZnlM/SlLHo1O2TE5RTmdveebRr2Vxmnmgnwgbm9NR16JubsOBhyfc0TINN5nNQQ4DSST4WwBsogMoqV+mF1BGApsSsAPSWoOvl+ZtocEvdxVrYm37LoWeZw8428UlaFaAuZ+eOixWoFoEkdyqx5MBO+hA5mygkzy8/JNr1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371116; c=relaxed/simple;
	bh=EV0quMv3ObCBqJ3q/y8sQ3bUfXMfM2am1zRyeGWm6NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwaZbCemCrVx1tRRkPzJnQsVMflNRVWa0PmdMmqNE7Mwz4DEPcAjk2JuQaNsmcxXc6fEsiGKTlyqxP1OHIzvkpD+0lvQ6s985LHsZ4jeXesTnmQT67muQYn8Vb4GVYta84VeVQwLAYZ4hpnRuHaS7Y4cxHwNLq3mNpEME06P+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EAZWMDgD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EAZWMDgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756371114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZ435TlQ+HIpGdaIluJvf5SpzIcZNmOyzGhWenFncpY=;
	b=EAZWMDgD7q8/bCGqXKpynvQV+Ip3apj8rXt3DoX06TecHfrRgisAJs71VT/DwaT+Sbgnhs
	U5uG1vv79WooO+pHAL8gjwXW8d3ttPCjHW/DP4WC/5Yd4R8IC7DBNAM00HAR2zthY7qpe3
	xn6u5hLkJ8/75R9R5T16BHiWC7B2Cms=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-D1ZaNP9BMhO9Rw5756X-nQ-1; Thu, 28 Aug 2025 04:51:52 -0400
X-MC-Unique: D1ZaNP9BMhO9Rw5756X-nQ-1
X-Mimecast-MFC-AGG-ID: D1ZaNP9BMhO9Rw5756X-nQ_1756371112
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870317642so171250385a.0
        for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 01:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756371112; x=1756975912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ435TlQ+HIpGdaIluJvf5SpzIcZNmOyzGhWenFncpY=;
        b=mjeqj3aJpH/YcSiwtxxV3XxQAbKxpgx2NoX251DUTgxEpFJh3AFAIWQIu+r0TTtZXq
         aFnYQr63n4nXUcPMUcHC6euZyZ7tEbfnhysOPxJPrXwWVxGVQbZfrRT9l6pBujf/+PKP
         LQKgT0eDk5Zt98TGfSC5hE59EVbBsxBmuZczMbnHJ+Qd4nROhOo0RXrjCp556YwtMu3r
         ZO5Sw+lOrhef8CyNJEo+E+hO22RvfsM7TGd2p2ouCnEbPatS0pwwZImvXwYzLjqkSoWT
         okL7P7FtpHsmqOvOpIRUnjrjd4P16nqKOjoGXWsgYUv4ISmrNBOLRZRksi/mHdqQ0DDJ
         vegQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5xsj4eYFah+hMohhzvoi1PvpuBZGInVAoP/4uRiiuwYU7a6Y0BwNAPw1bx6VG2dPpnYdvPxFQzNx1LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpNOVHLryHr63XrA5hg4BQgLDhMvKyCUjSVQfe1Ijwr1j80T9p
	8CDrJC5i376lE9BQAPUrps6oAyUcOC5JFnjvEgfHJ+bryq0duFxYQacD7HcHN9Y0tXgvY/NRWXr
	LLHV5ciA+nZEAut5kRVEaiIA57DquB6x43JjSCOB8M1/Lp50dtoIGpJbF7j1bBDQT
X-Gm-Gg: ASbGncth2wHUTrK+OAfrFzm3UBQWR6n0+VV2p97MwReqo5tnl3/osgFFiDSPsxP4YsH
	7BFHD3ab2i/Yj+FKOcEYBRau/3Bqsut94tqAgEAXb3ChutYFweNdspkqjllKrVZx0wxBDnjuQ8j
	ieJWSTx3Z5VlezYXBhJU5bBA4V3YIrTVbJz3qVLt0Lxl4ngH5Sjjp6UqO0RGdPNh8abKwaphudW
	Lzk2fZPRp2hWY5GtECa0ER5YDTHX49FaPL3K3e1Z6MzXMww8tCO3nFIZjlNkJdoFDD/WBJCT2ks
	Q67cjpNqtfLzeiAkZ/3VmkmK4vE1Jg/p1IVKEg6PuCskQvbO0MwJ5a+auyUKhXhoXD9G7cheUhF
	+Ns0gV8p+NvQ=
X-Received: by 2002:a05:620a:f05:b0:7e8:5f42:762f with SMTP id af79cd13be357-7ea110ba9f8mr2509916085a.60.1756371112139;
        Thu, 28 Aug 2025 01:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED4tnU8Ld+hquMWBtmhCmS8i+WkcLO3XqvM9PKFDRSGBc3lyi1fB02m6s4mjZWzdNveuNgJg==
X-Received: by 2002:a05:620a:f05:b0:7e8:5f42:762f with SMTP id af79cd13be357-7ea110ba9f8mr2509913885a.60.1756371111742;
        Thu, 28 Aug 2025 01:51:51 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7eebc37f2d8sm892208685a.55.2025.08.28.01.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 01:51:51 -0700 (PDT)
Message-ID: <7a5ef6e5-ea7f-41be-97c9-555666a3ef67@redhat.com>
Date: Thu, 28 Aug 2025 10:51:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] selftests: net: add test for destination in
 broadcast packets
To: Brett A C Sheffield <bacs@librecast.net>, Oscar Maes <oscmaes92@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, davem@davemloft.net,
 dsahern@kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
References: <20250827062322.4807-1-oscmaes92@gmail.com>
 <20250827062322.4807-2-oscmaes92@gmail.com> <aK8Vp6yrrIoQEmxr@auntie>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aK8Vp6yrrIoQEmxr@auntie>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z-EUetsdQ1mzZBXuchz6KKaHY1aDHK7h0xAGj4OpGFY_1756371112
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/25 4:26 PM, Brett A C Sheffield wrote:
> On 2025-08-27 08:23, Oscar Maes wrote:
>> Add test to check the broadcast ethernet destination field is set
>> correctly.
>>
>> This test sends a broadcast ping, captures it using tcpdump and
>> ensures that all bits of the 6 octet ethernet destination address
>> are correctly set by examining the output capture file.
>>
>> Signed-off-by: Oscar Maes <oscmaes92@gmail.com>
>> ---
>> Link to discussion:
>> https://lore.kernel.org/netdev/20250822165231.4353-4-bacs@librecast.net/
>>
>> Thanks to Brett Sheffield for writing the initial version of this
>> selftest!
> 
> Thanks for leaving my author name in the file.  Perhaps you might consider
> adding:
> 
> Co-Authored-By: Brett A C Sheffield <bacs@librecast.net>
> 
> to your commit message. I spend quite a bit of my Saturday bisecting and
> diagnosing,  and writing the patch and test.

I don't want to delay the fix, since I received other reports for the
same problem, but I think proper recognition should be agreed by all the
involved parties.

I'm going to apply patch 1/2 standalone, to allow repost for this one.

>>  tools/testing/selftests/net/Makefile          |  1 +
>>  .../selftests/net/broadcast_ether_dst.sh      | 82 +++++++++++++++++++
>>  2 files changed, 83 insertions(+)
>>  create mode 100755 tools/testing/selftests/net/broadcast_ether_dst.sh
>>
>> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
>> index b31a71f2b372..56ad10ea6628 100644
>> --- a/tools/testing/selftests/net/Makefile
>> +++ b/tools/testing/selftests/net/Makefile
>> @@ -115,6 +115,7 @@ TEST_PROGS += skf_net_off.sh
>>  TEST_GEN_FILES += skf_net_off
>>  TEST_GEN_FILES += tfo
>>  TEST_PROGS += tfo_passive.sh
>> +TEST_PROGS += broadcast_ether_dst.sh
>>  TEST_PROGS += broadcast_pmtu.sh
>>  TEST_PROGS += ipv6_force_forwarding.sh
>>  
>> diff --git a/tools/testing/selftests/net/broadcast_ether_dst.sh b/tools/testing/selftests/net/broadcast_ether_dst.sh
>> new file mode 100755
>> index 000000000000..865b5c7c8c8a
>> --- /dev/null
>> +++ b/tools/testing/selftests/net/broadcast_ether_dst.sh
>> @@ -0,0 +1,82 @@
>> +#!/bin/bash
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Author: Brett A C Sheffield <bacs@librecast.net>
>> +# Author: Oscar Maes <oscmaes92@gmail.com>
>> +#
>> +# Ensure destination ethernet field is correctly set for
>> +# broadcast packets
>> +
>> +source lib.sh
>> +
>> +CLIENT_IP4="192.168.0.1"
>> +GW_IP4="192.168.0.2"
>> +
>> +setup() {
>> +	setup_ns CLIENT_NS SERVER_NS
>> +
>> +	ip -net "${SERVER_NS}" link add link1 type veth \
>> +		peer name link0 netns "${CLIENT_NS}"
>> +
>> +	ip -net "${CLIENT_NS}" link set link0 up
>> +	ip -net "${CLIENT_NS}" addr add "${CLIENT_IP4}"/24 dev link0
>> +
>> +	ip -net "${SERVER_NS}" link set link1 up
>> +
>> +	ip -net "${CLIENT_NS}" route add default via "${GW_IP4}"
>> +	ip netns exec "${CLIENT_NS}" arp -s "${GW_IP4}" 00:11:22:33:44:55
>> +}
>> +
>> +cleanup() {
>> +	rm -f "${CAPFILE}"
>> +	ip -net "${SERVER_NS}" link del link1
>> +	cleanup_ns "${CLIENT_NS}" "${SERVER_NS}"
>> +}
>> +
>> +test_broadcast_ether_dst() {
>> +	local rc=0
>> +	CAPFILE=$(mktemp -u cap.XXXXXXXXXX)
>> +
>> +	echo "Testing ethernet broadcast destination"
>> +
>> +	# start tcpdump listening for icmp
>> +	# tcpdump will exit after receiving a single packet
>> +	# timeout will kill tcpdump if it is still running after 2s
>> +	timeout 2s ip netns exec "${CLIENT_NS}" \
>> +		tcpdump -i link0 -c 1 -w "${CAPFILE}" icmp &> /dev/null &
>> +	pid=$!
>> +	sleep 0.1 # let tcpdump wake up

Here you could use slowwait checking for packet socket creation, to be
more robust WRT very slow env.

/P

