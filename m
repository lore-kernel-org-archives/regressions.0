Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731A39099F;
	Wed,  4 Mar 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613895; cv=none; b=C+k0J7DTKYFirTKmb6OBvJCa14HP4WtdgEqba2nmD1ti4wzGqFnZh1dw4FaKR93hoanHdOUtOsp2yMVxl5vfRtpSAPAhJAxCNxH8Bjz5OhY8HxPJRwXtiI6hm7InPIk8LErzitAUcYaCG2E0ShTfSHdeyfCDgYIOyqdQEXk4LtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613895; c=relaxed/simple;
	bh=Zr2EHvNcdNm+PqYcDTX9XHKOEwqhx78U/PTWRK/RnvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpfY5lLIZDKYcb9YFDwWQl58ByzjtyJilVbODF/D73tP1wCPMgpIjZXfHVKasIzjRI9hS8jZDLDaHHj42ywG5yWN7iM8MARopsv5otRud7vjOffjI79QurSMRMkgijqEJC1BIfxwkDCjqbYaUFFGYrONJPekTHiLHYbt8kR/O6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S2p4dOCs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S2p4dOCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42EAC19425;
	Wed,  4 Mar 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772613895;
	bh=Zr2EHvNcdNm+PqYcDTX9XHKOEwqhx78U/PTWRK/RnvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2p4dOCsllg880Zc8GHX+kxQPBKN+FsVnmJyS/TKRENlRFKigeXdIEyp0gRT8mx4B
	 VDBzC1vyJ3l2eTKNlD3Z058iDAUIw+VxuX5ksXi57FkurcaXRBisv3DFAtFbLAYdl0
	 zdUpbmxGtozHxXuIrGBAyBluBmqgWb7p06P8sY2E=
Date: Wed, 4 Mar 2026 09:44:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5YiY5Lyv56a5?= <liuboyu2024@iscas.ac.cn>
Cc: security@kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Reporting a Linux Kernel Vulnerability and Requesting a CVE ID
Message-ID: <2026030413-unstuck-catlike-cb15@gregkh>
References: <7002e9a4.4e95f.19cb7fe6fb7.Coremail.liuboyu2024@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7002e9a4.4e95f.19cb7fe6fb7.Coremail.liuboyu2024@iscas.ac.cn>

On Wed, Mar 04, 2026 at 04:37:11PM +0800, 刘伯禹 wrote:
> Dear Researchers,     We have discovered a potential vulnerability in
> the Linux kernel during our research. We submit the vulnerability
> information to you according to the procedure and apply for a CVE ID,
> based on the responses from MITRE and Red Hat.

Please see:
	https://www.kernel.org/doc/html/latest/process/cve.html
for how Linux assigns CVEs.

thanks,

greg k-h
