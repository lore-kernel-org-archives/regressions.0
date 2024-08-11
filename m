Received: from mail.typeblog.net (mail.typeblog.net [88.151.33.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA8148FEB
	for <regressions@lists.linux.dev>; Sun, 11 Aug 2024 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.151.33.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723383758; cv=none; b=P6EPOftzdZw5x7S7b6ccuYPfNqOlzes09XcqhzwGtUgLSeDDZEflQSCkUY6YxOXEzqicOq8U/Mu+EOAFl7i2UkeadxByQazGcjLLeRJLUerxj+VPQxmPOJn4wQ6cyxZi2k+v7xH5K3JxAiV2dJ7Db8LrGRqeImpgIhfBZXOwTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723383758; c=relaxed/simple;
	bh=pfNi+gg4c3wax4XFCl4PGju4pYSvVmsWKNB09BfMBr4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JA/7z+cVVZ97ojOHVa1nADSzNHzTbvOHqgOidZf847sDOTe1tDaN4BDztGv2TnK6PYO66bTtIWIgaoX6lxI9AVhZgapxOIVpq7gkdBWiNQdRdRBbN4gbjgXn//5EpDnmrOdK5A86WlfzAbJAEyjA34tiyw9ap6Gm49AQ94jA6s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=typeblog.net; spf=pass smtp.mailfrom=typeblog.net; dkim=pass (2048-bit key) header.d=typeblog.net header.i=@typeblog.net header.b=JyxgTnhJ; arc=none smtp.client-ip=88.151.33.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=typeblog.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=typeblog.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=typeblog.net header.i=@typeblog.net header.b="JyxgTnhJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552E89B05D6;
	Sun, 11 Aug 2024 15:36:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=typeblog.net;
	s=mailcow; t=1723383379;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=ivigbb9xMm1ZNuDdd5y5spX8twxwH/H+kZwec4D/O+I=;
	b=JyxgTnhJdRhvid7qS+A+E7MsFr5L1oQwnAK/ROxakAzbSrt50j7bkFTlkwlJTvnaMU+pIH
	zCOpXy1i03noxA1dURp0WR68uKCiV/jKSEKV0K/jNZPbqaPmofLz5v3g+FGAdzL5Mx6KQm
	TFl2+sGUN+R9mxDIqt+8nq/gXAo3HW3e6SMrwcIbSBXs6AsNRtPxf6ZzbHaNrdj7bV3jl8
	FtQzPr1nSaFeyNbJYHvf/cvvQPU5i9ZAhiudy1Xnvag0bze7AOPmWANc9RnHJJ+Nk7DAjn
	ImWwSOpfCp6ny13pD+GG4GkPkXaU8eetshPojO0ec34VgRzZs9YfvJ1ugt2bRg==
Message-ID: <872a3e83-9bc5-47de-8514-48abe8ff03c5@typeblog.net>
Date: Sun, 11 Aug 2024 09:36:13 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>, amd-gfx@lists.freedesktop.org,
 regressions@lists.linux.dev
From: Peter Cai <peter@typeblog.net>
Subject: [REGRESSION] amdgpu enables DSC unnecessarily over MST hubs on kernel
 6.11+
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

I have been using a DisplayPort MST hub with a AMD Ryzen 6800U laptop 
(GPD Win Max 2) for a while. The hub exposes 2 downstream ports, both of 
which are connected to 4K (3840x2160) displays. Recently I was hit with 
another regression in Linux 6.10 (link: 
https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev/T/#u) 
that caused MST displays to stop lighting up. This was caused by 
4df96ba66760345471a85ef7bb29e1cd4e956057 and later fixed in mainline by 
fa57924c76d995e87ca3533ec60d1d5e55769a27.

However, even with that fix, one of my displays is still misbehaving. 
The display seems to be running at no more than 20Hz even though the 
output mode is clearly set to 3840x2160@60 from the point of view of 
both the Wayland compositor and the kernel. Some debugging again pointed 
to the refactored `dm_dp_mst_is_port_support_mode()` function involved 
in the aforementioned commits as the problem. Specifically, it seems 
that the function before commit 4df96ba66760345471a85ef7bb29e1cd4e956057 
returns `DC_OK` for my setup, while the version after 
`fa57924c76d995e87ca3533ec60d1d5e55769a27` insists that it must set the 
DSC bit, shown by the debug kernel message "Require dsc and dsc config 
found". When the DSC flag is set, this display of mine seems to just 
misbehave like what is mentioned.

I've done some further print-based debugging to identify why the DSC 
branch is now taken. Adding a print right before

 > if (stream_kbps <= end_to_end_bw_in_kbps) {

gives me

 > [   38.079643] [drm:dm_dp_mst_is_port_support_mode [amdgpu]] 
stream_kbps = 12798000, root_link_bw_in_kbps = 12571200, 
virtual_channel_bw_in_kbps = 17176320

Since `end_to_end_bw_in_kbps` is `min(root_link_bw_in_kbps, 
virtual_channel_bw_in_kbps)`, this causes the DSC branch to be taken.

Before the changes that took `root_link_bw_in_kbps` into consideration, 
my setup was clearly working and I haven't encountered any problem 
whatsoever. The value `12571200` also feels a bit off to me since if 
this is fetched from `aconnector->dc_link`, it should represent the 
bandwidth available on the entire DP link between PC <-> MST Hub? In 
this case, it seems to be way too low to be correct; and, again, the 
dual 4K display setup has been working without checking this value. 
Modifying the latest mainline to remove `root_link_bw_in_kbps` from the 
equation also seems to fix the problem for me.

It feels like my display shouldn't misbehave like that with the DSC bit 
set, but again it is the kernel that didn't set the DSC bit before but 
now does. I think this should count as a regression, but I'm not sure if 
it is just me who is seeing this problem.

For reference, the problematic display in question here is a Samsung 
LS27A80. The MST hub used is an Anker 554 USB-C Docking Station / KVM 
Switch.

Regards,
Peter.
