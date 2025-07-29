Received: from outbound.mr.icloud.com (p-west2-cluster2-host6-snip4-5.eps.apple.com [57.103.68.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4522B594
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753808571; cv=none; b=lgHuXR88/tVslwjR9leV4/UReQ2oC4/1h25aj2U4vHq5HmXDZb1u+F/qIh2VmItxsqlUVl8TT/YfsB/hPBpFrgsf5jAx7v5zwjCyNbx1OEpEjCB26qy6/gyn3yV4PMjmkfvr5eeOXKOoTYd124x3hEwSCX/vEuYi7zI0J5/lkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753808571; c=relaxed/simple;
	bh=z5lVWEyhRjpAIMMMSlYkaE6Gs7dQt9oOELh6Z5S2jhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/5/1x6Mx1lxJGYpyz1ckIPMqvdWZeGwG0aByLegyKiiMw7lARFUpSG6nfoTuOMLFwBdfKWZ4a7KVMW+y8K8FaG/5aXpv6wFg6JSNgIxFdLSIfzPtK8WK2zKYTMJYt7BVrfCVP8rituWQtSi9fMUz0jLmNNo/NyuPBy1xj+CPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danm.net; spf=pass smtp.mailfrom=danm.net; dkim=pass (2048-bit key) header.d=danm.net header.i=@danm.net header.b=RHeeoU9G; arc=none smtp.client-ip=57.103.68.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=danm.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danm.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danm.net header.i=@danm.net header.b="RHeeoU9G"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id E4F831801B78;
	Tue, 29 Jul 2025 17:02:45 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danm.net; s=sig1; bh=9xLNaOyeP5gUs6xyN/Zn+G//i9ctghSvXpkVgxQaTjQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RHeeoU9G2/McAZUQZk2CHgHa190nnilljIERncoP9YyFEaMyEDUdqH8M/kh+xQtTQd+xbMbB8NhAGd6r1KSJ8yIap7NGLEwMNaCEfe9waMc7zj4GBRPZK4jugtvGkli32NFN6EaCJYH+aG0g5ShZmaOyCdbOrJ1wYLNdqP+hhvpEWRV2fjpLGynYppo+yDMm5e6MYyooI7lJS29tAjpOOEF/bI41nKS6k21CVJ9xnt1hUWzMXZgNStXtzhqXNUKGmd5f9dovWEP7ohno6YrKLcrHXKOrzjGdK9dJMk3HLV4Y1tWHbvfQ8UddkRuYDAcKwQsO6JQIvwrY8j1kP4BQ8A==
X-Client-IP: 67.163.93.242
Received: from hitch.danm.net (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id 08C2A1801B76;
	Tue, 29 Jul 2025 17:02:44 +0000 (UTC)
From: Dan Moulding <dan@danm.net>
To: fw@strlen.de
Cc: dan@danm.net,
	netfilter-devel@vger.kernel.org,
	pablo@netfilter.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] v6.16 system hangs (bisected to nf_conntrack fix)
Date: Tue, 29 Jul 2025 11:02:28 -0600
Message-ID: <20250729170228.7286-1-dan@danm.net>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <aIgMKCuhag2snagZ@strlen.de>
References: <aIgMKCuhag2snagZ@strlen.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YyhzyWoXskfZvr52KvJWbZmowKUVTEib
X-Proofpoint-GUID: YyhzyWoXskfZvr52KvJWbZmowKUVTEib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEzMSBTYWx0ZWRfXwexiZibsaQfL
 e1deKMjO8yrO5dfRwhQEOAiIqasFdB6A89C2o7aICekwG4iMQdYKQrQD0Z8SgUCtNMr+VKxjPER
 EtUfTwD4Tz6ISy7xetC9hMlvc3Uf+blhQExTC/jyecnwEzbyFjtD4IcFJosoOqNcm+c8KNV2XwH
 DA67/dPaY/tLfT5rvAHgphkm03uaVO5wVGjI81Gta5we3u4EOv9UilkqSdrJUQuHdJJFrjAA5Ud
 sEGLEz1dODCTbDBLKDlNOXU86sx+2oT/I+vnO6QQ+lbiFl0P/MV8/Nu8FLesIF6VKoJCnWP4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0 clxscore=1030
 malwarescore=0 mlxlogscore=914 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507290131

Florian Westphal <fw@strlen.de> wrote:
> Bah.  Can't see the problem.  Can you partial-revert and see what
> happens?
> 
> E.g. only revert the changes to net/netfilter/nf_conntrack_core.c

Ok. I just tried reverting only the changes to nf_conntrack_core.c and
the hang no longer occurs. This is on top of 6.16.

> Is this x86?

Yes, it's an Intel x86_64 Gentoo desktop and virtualization host. But
kernel sources directly from git.kernel.org (I don't run the
distribution's kernel sources -- I'm skeptical of the "value add").
