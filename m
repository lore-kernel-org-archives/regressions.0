Received: from outbound.st.icloud.com (p-east2-cluster4-host3-snip4-3.eps.apple.com [57.103.78.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA8344D95
	for <regressions@lists.linux.dev>; Fri,  8 May 2026 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269712; cv=none; b=WnHebR4WwRu42zyLaeIFQfRhkQlX6KUeEStM0gg+L9sgc9OGZ4vKYolQceNqICesUGwMDUfH/TL6GFESusf6mzXAtrMrv5kKfldhPVXLGhmqUzP7nPSmQ96QwZXPkbLigBSuL4NfzjaPsDLrem5TehMhrII0nnSzxLJNcLeAOYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269712; c=relaxed/simple;
	bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=mQSQbLS0uGmQnWWToCgYQeYmtsX373bQjUrNDQTeRv/2ijuk/+Vj3W/5dZiYmjL6OPCSNbFYNRhSnhx26YFRtJ8sO20sJ+MnS/OFqjJPtbK2Ye0iMidSGLUJYzb7m3PGQLzVfDX+9QrVJYbsB5WTBUmuf76AVNQ2uQWDhAwpyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jackmatthe.ws; spf=pass smtp.mailfrom=jackmatthe.ws; dkim=pass (2048-bit key) header.d=jackmatthe.ws header.i=@jackmatthe.ws header.b=eNcsieeA; arc=none smtp.client-ip=57.103.78.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jackmatthe.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jackmatthe.ws
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jackmatthe.ws header.i=@jackmatthe.ws header.b="eNcsieeA"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id DFA9E180033E;
	Fri, 08 May 2026 19:48:26 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBOHV8DWRxBAEkdXAJZEhVdRVkMVAByGlgbWABWH0YYXFZEHhcNVk1TGVAGdwFTE1IVUhlDA1deTgsTH1RWBFBRHV8CCgRHBFsXRgNTRUEEFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxpYG1gAVh9GGFxWRB4XBlsUBEQHW3ZZAjYBQR4oBVsKXQ1IClwaU3BGfFVxWHRYCjJ/QAEvA1lyGlgbWABWH0YYXFZEHglLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jackmatthe.ws; s=sig1; t=1778269710; x=1780861710; bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=eNcsieeABmpQUM8GgihjGZDprv7OCoAnJpW5sYYv6KLHZFzh11g7NO94mycfS5v0ycTEz5Za8Paeirq4uAKPAylYZyTw+aEZNse+7GFQapqJxUYOdNz0ZelpT0OyzCaXlOStK5lXUOyU1vqK7+UQTpkG84KIu+HazAwOWfTXNs4XDBi+I/oV7R3lXRp43cjfwpx2MrgRd9YDsBGj2parM7u9swiKhGEa8VEnLaEXQiDC+fc47m5shmZNS3XvhgHhDm5k/WQ+hf56qUhnVaoKFYt+jwjDn7lQYVAb5gVeoPxAn6wtzXZm5ejXtfOErZ6c+pASIU4HneJan2NPjEig1A==
mail-alias-created-date: 1756088113082
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id 96F5218006D5;
	Fri, 08 May 2026 19:48:25 +0000 (UTC)
From: Jack Matthews <jack@jackmatthe.ws>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Regression in split ARM MMIO timer driver
Message-Id: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
Date: Fri, 8 May 2026 15:48:14 -0400
Cc: linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5NiBTYWx0ZWRfX1cSdufuGzJGk
 MsMfGVzylnzT3W9mXQO0C6c+96va1ZMnU3x50t2Ps4UGj+2ueM8fjwcz19LEkKbdR/Co0Lsk2zU
 zR8ye8kDHbB6zaGKj7yrBoPQYCNJ+LsQ010z6FlpFGhLJ31G7pkZj+/eD/iXH4M8WO9M8GvBYHS
 uT4QgSanR8H+Sd1FCYOaLugIirNtWWgUrXckpnoYX/Okh4ozZK2ivU3m/QWvyP9OwUUwBpPUcj6
 eyo+fofExIQ45itVYBVy6JRcb7S61DRtD50296kg7zPdA6oz845nOR6F1N9bqHPzmjGg4c94Lry
 3S9NC9hR6Wj+KuPkB5y/WAmKMZVQYjqMO0vyzZKc0VtGWEv6L1d4VtimnAjI68=
X-Proofpoint-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB
X-Authority-Info-Out: v=2.4 cv=LKNrgZW9 c=1 sm=1 tr=0 ts=69fe3e0b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=KQRe4iotet5z0gzynocA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB

Hello,

I am working on mainlining an old chip, Qualcomm's MDM9625 modem.=20
I had previously booted 6.17-rc3 before putting this project to the =
side, but when I restarted work on 7.0 I was unable to boot.=20
I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a =
(https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and =
reverting this commit makes the device boot successfully. Unfortunately =
I do not have access to low level debugging such as UART so I have not =
been able to pinpoint exactly what is missing.
My changes for this chip are all available here in case it is an issue =
of my own doing: =
https://github.com/jackmthws/linux/commits/mdm9625-latest/
I apologize if I this isn't the proper way to submit a regression =
report, this is my first time doing so.

Thanks, Jack=
